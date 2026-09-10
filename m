Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690C7489FDC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069971; cv=pass; b=c0cKw+Po0kpLEShUTw4DY4os+UIGqGBUIzgmk091ZOVQdbxtgcxR8LXPnIt3/l1eDoVt7COrTr9bsMeC8eMi5VgGQhpbQ67X2fXMPBpLnY6BEaiPoaQXtLe1/7MacbveSjp5t/Ox7r4v01AVPfnnVBV2yZJ5QovJLsJQcV+Lie8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069971; c=relaxed/simple;
	bh=5BYR2LAlRCG7N5sJ/J8MZfMB9gZi5CyLaZoJi76cKSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=to8urZYmJsxIu/TSnlHqjaCflsN2KZkcAdCZpEgAKKSUDg7aLX+ZBsml7b1PU9uHHbE5BtmckfmPTNzRk+wnnEYyuUls6ALdSJN6RUhs5PMxSd3CG19FsEKdxcLdMkKPvk8d0Djjpa+O0F5nnAqUGCDDpHwkaiDxg7WOaqlLeiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PDrO6TR5; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PDrO6TR5"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso80502f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789069967; cv=none;
        d=google.com; s=arc-20260327;
        b=JqlDFl5J328u6jlRK2ZOrjRDCrpvuIAVBlic5EM4fDNn383co0mxZ2CoPsXyo0szWm
         Yg+ajb1Ri9A7H4cgoRNPJ7XHRmmsaMu4CXNAJRKRibWYf1fNcygkIeJ8R526oTIM3VLx
         Fn9xbSJBbKIrOQ66VSQetNLr+8oczMtKYDtP+nErhSNb/ONBvKPrc6BJ+G11JcH2Mwma
         +bYyUgJo+SROXGkVG35kZkdd2Z8SYC0IgGURZcSGJYjPqEIIwXMqhzCzXeL7R8kvilT3
         mUUqn6oxinPG2y8h8b0OHGrae9ej3C+FMDpBM2sbgx0a/1pd95FjyeWxQ009zRfTUZI6
         vlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5BYR2LAlRCG7N5sJ/J8MZfMB9gZi5CyLaZoJi76cKSw=;
        fh=c7IswQ4SvC/7Y93ZItvcfOES783dqEU6ZOTA0lGj6kk=;
        b=eWaqNUUBSiC40NDQO8YW9GdOb34GxWQ+Zmfqq/iFz/1Iw2hOT63FQZfM3d2mYk2tSn
         wYvSfmCm9NSE6Z4wH4prdIVDdb6QQ/JqlANswJ26POObeH+ba0g003NVrcra40cWMg0V
         OhSO+BykaKOD8QV4LFc+l7qHArRbasLVdgOPo3HwNJcM9KoZNgLafIeKBrxMjjlKnnyD
         m8cA65ooXFWONIgQESjT0UGgRQEw5sjz6lc+jd7Z6xry6R3wGK+dpMhlibIeK3LQLfdb
         LLSK0J7tmFz5ookleWopxtUcbAGVgbg3I1evA/T6Aa7l3QWRY/LSc8vcWqyMpD9UgiPx
         EmoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789069967; x=1789674767; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5BYR2LAlRCG7N5sJ/J8MZfMB9gZi5CyLaZoJi76cKSw=;
        b=PDrO6TR5mHiQ6mkfx3NfMoUR+P1inFsrAZ095Ddog1bZa/C8T2HrTVJucMd1/wImuc
         VTYJ53FTrIo8pO0o792CjTEcUs8tbp8u1Nkkz/jK/MhRyO06432FWYfJ6FLew3FXjubO
         PlY4oU/WdLAF93SxgxAcYKhj1FRrtm9O74Go/MqEZ503bFBZjm0JEWaFBmrCz2tLle81
         zYQxlODiLL5k9wC8kwRIjWrcqyMbHd2Hweovjsji+1muXNvY3rvoOOR/d78cGdEIv+Ff
         Kmsdq3B9OWUgaBgc7aENU8I07kTfkdgkrotJkws/Mi3Hqzu89rTynCZE/26hSEPmocjV
         FngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789069967; x=1789674767;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5BYR2LAlRCG7N5sJ/J8MZfMB9gZi5CyLaZoJi76cKSw=;
        b=KsCYVtGZ1l3eMzP/ruEKkNh19349cTNe3nMenOih4FmVRW38ynKwpVh5/5jCWK3DLR
         1mZS9EF11XVJnlE0U6tXKekajBCsmIiKTSjFc4B1+tm89ublsUdFCjH+BPQrGAkrX1WD
         0TizsRld9mUAaaU/lXiBXqD9bAtJ5PqQop4GowKevsqUgQqbE6lftDfJbsofkQe58Bz3
         rQPoZMvIyTMZAYHKpfB6TK9qNyjt6WSmI1OAK2Nle08M6lZ1SpCgNMXYltoO6Dck0554
         LX/qwVO/PgpA5Wp5zdZFDRlxN/YsNx3fGlPjKviqKMnJ9IMtd1vuWgAtrDebmD/jZ0hS
         xkQw==
X-Forwarded-Encrypted: i=1; AKwUvBxv/LmQNuQb6/FFI1/HH2Vp8Xa7pmKpLCWEqYw9pwJy9faXqbARHcsH0KxfiuyANyHPG57bx8JVP+lDJOc=@vger.kernel.org
X-Gm-Message-State: AFuF++l9mHlaIvwNFAUB48MIMPCsiQXnO2Nod4/o33FWeCS0BBSk9kF0
	/3XndZ5m7nYSyxvRmLcSRpNO0bd4ot2uD0CV3F3quFEJT9GQ9o+Ck+CPR8z6OK+Vznpmky1mPdM
	CLFZWD+vGXOLrQ/KgE56ignxcjNujBlGIEpE+UK88
X-Gm-Gg: AYBFou0CkSP5eKUDnl0pzgzRjU4AR/FatV2Eq+l1P10a3SelxZXG7VcLQRP6BZYKz74
	l/Ow9jdLkpmIdJfftbpNikxRywvca6RQtaoano6sH6we1Hfk37z/RCmszKOggIOxzzDePlqB52B
	SHWG8WxX/heE+Q9Rv1n2Cl5UQbALGGmYdpio1ruGtGgVzKTX5GJ/b4kC0Uqf5sCAA2+1WV4bt3L
	W/CldzZg+BEqXQGcIDZV7FFtWiw+Y3UyouSjjRFHTanQ3AzD/1yL1Q5QwDs1YQ8xupSOIw7xb3a
	MZhrdok6jC1V9bgMO7Xma07OshJ9Uvqi9Jm7sG+z/wJxy9eGgQIKptn6SYQSt5rPMzQH+fWLo4H
	4yXiFmfgwsw==
X-Received: by 2002:a5d:4483:0:b0:482:dac8:cd0d with SMTP id
 ffacd0b85a97d-486eb33ec05mr931955f8f.21.1789069966721; Thu, 10 Sep 2026
 12:52:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904234401.2339633-1-jthies@google.com> <2026091023-numeric-husband-1b03@gregkh>
In-Reply-To: <2026091023-numeric-husband-1b03@gregkh>
From: Jameson Thies <jthies@google.com>
Date: Thu, 10 Sep 2026 12:52:34 -0700
X-Gm-Features: AcwNN1W1WwceoXxfw7kV1OcYc7DN9h4A1Bt3IOdWqxeC9UAzLths1l0qeH57h3g
Message-ID: <CAMFSARfnRpkq21j7WZYqdthy4aC7VSPjQAKm1eHvbYxhM6pOnQ@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: displayport: Fix OOB altmode array index
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bleung@chromium.org, akuchynski@chromium.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg.

> Does not apply against 7.3-rc2 :(

7.3-rc2 and usb-next include the v1 version of this patch which fixes
the OOB issue but doesn't incorporate Heikki's or Andrei's feedback.
I'll send a quick series to revert the existing change and followup
with the v2 version.

- Jameson
