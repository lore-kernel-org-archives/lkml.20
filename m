Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAA3438019
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559560; cv=none; b=fldvINDQdFqOodBv3WWc5RlQPlY4LvuHYH/3HC1KXutKTzT1BHO5Y2SoFjytErC5vTa9vk6Qh+DwNEWG7UfopwOmDRqpBEE2dOk9hjrB6/k0c2J1/YyKdWreYUfSbUc9VIh2U6pF0HP2pvBPh4jFRNHI9HLRtGKgQrYuNEIrG3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559560; c=relaxed/simple;
	bh=VDGVkWv/SanQJfzhMe6kHzsYejlhU63zpWo6JK7BBn0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=V0NuuAy9x3WLgwAcHd9/Mpg3HE75Di26+RRtIftVicT+2PWZC4i4+35WrZ7ELHIakrQbuAKUUf8W365MBkuK/Gy0ByJpM6bsZfihpAEPYvtsEiziWFjIioX88zxdSq/FSO657XIqtB2Zz/KU8r81yWNwXjO00eIpCIfB2HSysiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MI+4ueR9; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MI+4ueR9"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1c1cc5206so1780341a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788559558; x=1789164358; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xi0GrjNtf+j3mFnPowGAqEQrMP8mYt8469qIGDpsVtE=;
        b=MI+4ueR9gRgsNE6ne12CDHGYnMviqu0uUPob7TKw1NtbOEbzwiQfAs4aiq5Hj0YTta
         LZNJvqu4m6gcCvkRXtWB+z6ltCHwLJZI4D/1/wybdGmkCJGaR0emvCz4DI9wMWBxb8Al
         kK4URgrUw8daLy5CnZtaXttDnPSs1j2xwYb7NSu0g04Atcb7ATNaRhjp97wKGShzF4b6
         gpREfUVmDGgfB8fVYW6qTxtWRYcNQuI2kWCUyp0sjbLF+3N+ivkUxO0nqQ0tklo+ZlH3
         9kNldZ/ALQT1KzAZ74SwOEculRc7DG4GA8ZG57h7EgfsYaVbm899S41BdXGbX5DM3I1V
         PFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788559558; x=1789164358;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xi0GrjNtf+j3mFnPowGAqEQrMP8mYt8469qIGDpsVtE=;
        b=caCJmdQiP5y3wRjavPXwFYHRnS0Qih2EXy8gr9VD5+xeZxU+pSH7Zqj9/M3zhWyg4I
         cKdCYVbQpnnbNNYUgpa34FxvH5JW1dkorE+XGizsYDERcTUzxLIdojfnHgHYhbOzNg0h
         4LWsKL6x+JmTg9dduNJ5uLGjJuMNzw6hYwe0NuK1m/EZL22EMYFt/Zv9oCh23+DHZQHU
         mHoUMttgUrYE5nl529u8oMYVBFfU0z/4FMMEqOnb2CpUJOqQDLGyktjknqKKV1WDQMrK
         hiGgDdRVmIWz9kXhy0aRkgBnUw15toCorXCtaWk0jOJ+zmUI2x7J6JiWwNmhYmy7IO21
         TF8g==
X-Forwarded-Encrypted: i=1; AKwUvBzIzF2vjggOKFaHIyFDE22D3jcbsWIrcvq6nXqjQ8K2ZdvUoufpzdwAz6ERJaKkWVYmbnVYl1aEyoZoFlc=@vger.kernel.org
X-Gm-Message-State: AFuF++mdMV+ZG9PZK8FUNZHHt58TLa3MvGEoZ7CxBHXFYI48kkm1SoGU
	9Le20anIFfn5A4B5EmCWX4VYP+na1EUtnEWQRQkfyAYC13JmWQzYJjEvwS86UUlhlLt7X8BKb0p
	e/nggiqtI1aB/UQ==
X-Received: from pfdr13.prod.google.com ([2002:aa7:8b8d:0:b0:85f:2b12:262a])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3021:b0:857:727c:a1f3 with SMTP id d2e1a72fcca58-8616907fefamr12452673b3a.21.1788559557820;
 Fri, 04 Sep 2026 15:05:57 -0700 (PDT)
Date: Fri,  4 Sep 2026 22:05:53 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260904220555.589752-1-skhawaja@google.com>
Subject: [PATCH 0/1] liveupdate: Add documentation for file dependencies
From: Samiullah Khawaja <skhawaja@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, David Matlack <dmatlack@google.com>, tarunsahu@google.com, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KEXEC HANDOVER (KHO)" <kexec@lists.infradead.org>, 
	"open list:KEXEC HANDOVER (KHO)" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

I sent out v3 of liveupdate_get_file_incoming() and
liveupdate_get_token_outgoing() series to add documentation for
dependencies.

https://lore.kernel.org/all/20260820191854.1642931-1-skhawaja@google.com/

But since v2 of that series is already merged into kho/next, I am
sending the documentation as a separate patch.

Samiullah Khawaja (1):
  liveupdate: luo_file: Add documentation for dependencies

 kernel/liveupdate/luo_file.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)


base-commit: c65687600ed075d237a204755d99ad538db34b47
-- 
2.55.0.1003.g10538fe699-goog

