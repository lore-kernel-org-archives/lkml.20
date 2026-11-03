Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744171;
	b=DrY+RMN8n8YSKAIRulOiROzLw94++fTiUoTKuzo7rYJYFLLBZs0g11R2D/Kzjvh4vu3Z
	 HaMmx0Xw2Bhxt/ZDy1rTOg+FPLW5W7xsVOrVjppKHqwIhnkkxc8gQIfl8xtRc2/lZF9w3
	 BJ7go8Z3t6hMJxL/LCUJeEXl/2SS9CfLfWJOYw45Cu1AWqtP08Up2RZiAI8agW6p+t5T/
	 syYD14xIbDJZP7UITjInXsacPCirh+I3AjRj8+Rhjg4lOWzK9RWt+/DsXidr86zpXaKI8
	 AEJr0gZ4HmTz2mx7UssbURRqj8k/L+B4Yd9PKCw9sUaluf1UQe+bHkB9/ugRGK6cVcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=qa8VIormBe9BZ2Z0CvscCIHYAfEDqSjiMypNAooTP+E=;
	b=p4j0/7Wcp9hnmhxKzK2zlbbSbvAyBmHA3noHC/CrCZQG8eXcwUruMhx7OYKR9BJ0IfoB
	 BCaJh3csRUIerY0xGiAX2N7ROO3jU0NhkHVQEPX8AFir4gcapf7j143bFm/nEGhi0df/j
	 Pj+vydwpRSjtAAlIDbmGjnMieCR+BvTirjzpTCbqTmKb8vhi4tCS1xP4x5yFcgZeK7KaJ
	 4mqh5Cll3fDZemRRQixmvsdsAYhHbos4hgzHckRaOak96fbAIe2i0DMjgz9CMiyg82zyY
	 1TRNocFJDOnEkpI1R1FLt0usIW10bhMn0xxQRO2c/6Yyqu6jVObF/mxx/PQu9v7/14A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rosaliefang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AWcwRPDt;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F97C606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F97C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rosaliefang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AWcwRPDt
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd67466211bso63423a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793744170; x=1794348970; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qa8VIormBe9BZ2Z0CvscCIHYAfEDqSjiMypNAooTP+E=;
        b=AWcwRPDtmQG74XqxrJf8arhP2mJ1RnL90FKpPfAEE1x7WIjbXPmscmsV8Niz89g1S8
         9Q7zT+HcgHYNHiGmgMyqIdesL4+6AHgvKDon2U/8244d5IgdEN/ax9S4ayYyTD10sVU/
         wA4MXzVK5gZQNA6/XFOJEyH9OMazwOQwf/5FDE0KibWZ5nFkYQjBua7p2jm5WLUWVBXW
         qqnq/32NScvAuilvdYmS7Tnmlq0bhBBtnuvqU97LkRWeV6SWespZjZR85282mTkT49IS
         VqI4NiG2giuqzIRyTdsHLY2QpOXrNt1qtlLGtkUiIbAdcBXc4hh8dWS90Qv1JUFX8qCb
         a1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744170; x=1794348970;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qa8VIormBe9BZ2Z0CvscCIHYAfEDqSjiMypNAooTP+E=;
        b=1y36qr3AuKgIrjiVUgoKXodlEXJCqoC/aBhaPlhNiYSrNQFLzZ7/nr7Lp8in1ZjGMb
         gFp9Z56AHmDQAp7TGFDrndcpZUKQMuOlNN8+tXCKoqrmJYZuv+htBYC/+MCCCxw556Ar
         AHABu8i+DuCfngqNh6zSErK6JO3JCIuSX+uSEQeCraarOA9GiMzKiXfU0xGkibhdaDVg
         9b2NYLfdBzpWxdXuDBGaOb7vwRwbP0AD15ZCUZMwDmHjK7zy7php6C+LT/7ancVYLGiC
         MEMgyQHhEbeRrK2UFVi4mW7v+46SW7jJrmE33vnn9qtIGepol+acfZX2G5St7LVqbrgD
         kIxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcshbNSEmr9UYOg1Pij/V7LoF5haiXI9jAZOvqgow923jv0MakLSrKqmXg52RpWBqb2YcncCKhqLJGWgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gt1X/feoiu82I4TY/BNN1SrjBI9IIThWHtLksOisWw7oTnKgF
	pr6TOp/djyd33CEENz/SDcM+TiWuXi3/2eJX9LN3vzDRqj2LCt7lYeXQUxAPICSSF+XNJif/65b
	QxmrFgUHpKJF4EljP1wjdtSjvpA==
X-Received: from pgca9-n2.prod.google.com ([2002:a05:6a02:6389:20b0:cda:e974:da34])
 (user=rosaliefang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2f0f:b0:3ae:8106:6074 with SMTP id 98e67ed59e1d1-3ae896f8183mr12261152a91.16.1793744169711;
 Tue, 03 Nov 2026 14:16:09 -0800 (PST)
Date: Tue,  3 Nov 2026 22:16:08 +0000
In-Reply-To: <20261103190052.GA267580@ax162>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103163404.159582-1-rosaliefang@google.com> <20261103190052.GA267580@ax162>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103221608.2030675-1-rosaliefang@google.com>
Subject: Re: [PATCH] lib/base64: fix -Wconstant-conversion warning in INIT_1()
From: Rosalie Fang <rosaliefang@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kuan-Wei Chiu <visitorckw@gmail.com>, 
	Guan-Chun Wu <409411716@gms.tku.edu.tw>, David Laight <david.laight.linux@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Greg Thelen <gthelen@google.com>, Yi Zhu <chuyee@google.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 03, 2026 at 12:00:52PM -0700, Nathan Chancellor wrote:
> Thanks for the change. I avoided this in a different way, which has
> recently been merged into a tree that should be merged into mainline
> relatively soon:
> 
>   https://git.kernel.org/akpm/mm/c/3af83c11cf5990fda0bfe3959aa6391ff903ffdd
> 
> For the record, I do hope that
> 
>   https://github.com/llvm/llvm-project/pull/226775
> 
> eventually gets merged so that these workarounds will be unnecessary but
> I am not sure how that will play out yet.

Thanks for the pointer, Nathan! Please disregard this patch in favor of
3af83c11cf59 ("lib/base64: silence clang-24 -Wconstant-conversion with
diag pragmas").

Thanks,
Rosalie
