Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567927;
	b=5rBmE92DHCjVvWUaDQDideauGMChDHkJtZiTPd/AN/+FDId9plYI6NNYlUamVlu2Z/xW
	 zja7/pSBcmpW/DLUTBp9Jl5PEPeqtB6KOGx4lnoLKRyx8Jxma9rapNUbb284WbKyUkNWa
	 Epf2lp1sN6u6HWV0wdX3XUEnWNbavxtmDhl6dpt3SDSsNi585UwVujfbrPGGlhNUOsLuY
	 VD3NktcjQud48Duv27TP/sgxI0cYgr+PbzVHo1ta0bhEChmQPZldlaZla4xlqFtL3aPGk
	 9gkYYF2aaQghtyGTvn8PesoWQPUtHI+VVOnUsy5qvXP7ft0Fw+Ps/Nv3lASrU4C/J0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xRGKkjeOSqGcAp5GlRiWRSP+3SQ9eykn8zcI3aD1Tfs=;
	b=BGue+I9HZtKhNZWlyI23qXaroR47vz3kBlTm9af8365SIZwwqQ8K/sfpe35AgmNOv7FK
	 VYt/TNYdXq3wYUC5yi7TGPsetl/VMZVuYFfPqox12Xlqblo0WiuG2yEkT39riisgBZ60r
	 2iwyyJ4sAd/mCB7lvUrjJ/x89pcODiDOKyoOBkOiq1+4upfQcOowoTYy5kRjimPlfvChD
	 sbTfnITRE7Z7KAAv2GdS7ZtrWqmrTZuFFtGqL/9SRhdvKsriNL18Cxwkb2iT17m+ottIl
	 mvl6AdM33HhzxyUjdieeXnxysjt5pDojRvY7/4OnGYC15AtqUQc4A6u0IluXSJU5S/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kLPWmVAw;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77021606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77021606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kLPWmVAw
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37628596783so1460696eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794567925; x=1795172725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRGKkjeOSqGcAp5GlRiWRSP+3SQ9eykn8zcI3aD1Tfs=;
        b=kLPWmVAwBLnXC4fO18rxl2C1rfM+F9LVv0lB8MIzPOD3yECFfO6qPjIJLMysl1OPKY
         mYWEA9bBLKPPPfUkxOOJhm2+V2YofnCtu6qh1M08XN248lenH/sbNmSBG1SWGMkrd4Af
         Q+mOQfagGr/OLQM1lJ1yGeGtGGwlc1lIZ4mWder3EYbKmwWpPK4Sv/kofKZP9llFGrLu
         VOXf+e4UW+wcsR6lBWKkXwiPfEJcNA5maL+6wJjkhfdE5Mrz8WqkA/OTYgJ2sA/2aXza
         lCh7lGfE98GrAV0SfMjlbL6zhAkV23iv59bkGUAFKPi2JoHGBUNL9hyXkY/e6lIghd+p
         qrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567925; x=1795172725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xRGKkjeOSqGcAp5GlRiWRSP+3SQ9eykn8zcI3aD1Tfs=;
        b=si1HrfvwjYfdNYhT4jTO59MlPTWW5mLWjglPaNXWPZOUxsCzfBCgiX6kjbIqlmKCGv
         hpCWeBx9Yia8BVEAC1U7XUk2Pp/J2jowoC80LjWpQa34jEO9j4Rb5VjbDWPx69gMP9kk
         QJhZ7pePJhYaZ2KgZiY1Di2onFirfz9SsLfKqmhTAZEDKj++CesbVT7WeYqKKDN8pSQd
         kR2+kHqWk2jH5IFiOqcykJESwTeWrETlHtVjNSquGHXvY17AfVZpuaMlPfkDgAHPrKhw
         gUxZntkcH+v7QIh5ANpjwcMn/NIZv6k3upMx6GVGR4dvnw/4OuqPzCu56X+pymaoZ9JI
         1NBw==
X-Forwarded-Encrypted: i=1; AL+hErFA5P3SGLDggJvED6FRFutZ8IepczqzT9+o+TAcAUd0o6+OBz9oeS0j2kN+S47dRLDYWP/tzJFkuVhCR9Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CNwc4Z3ci3+6KxXr08TMfXiiaRb1Feodos9ulrF8Ne9qnt39S
	Pi2zLP5V00+SMtVDeH2giFTNxFjYtg8dGrRoBfOPI/8ut4iO7dxR4wouWP81Q6iEtN0=
X-Gm-Gg: AYBFou16q96R8Nd5QvbV/Ro/FgqYO+/xKmJRf8i29vk7oRbmMbRLgrrJgO/2hlQAuVr
	exKMoG8f3AkJtlPa/Cm4vYNWNVJaTrQ3M3lZ30OQF8mBmFYzcKvJPj2FWblGT186MhogHUgefZv
	n/rjsjlZd41qD0is6UaGkBgFnC6ekQ+DskYCR99QQuYjCxQ+k1p/YZE3mSzi0JZdhogTRhikr7j
	MOczqyDiJxcmyVoZszAq5i2TIcHTMYxUtCSdCkNrF6ZHvoio4tJC2anSwaNgr5PbjrPjR2FvQeO
	8fSS+PWRBCKce8Tu6hRM2hup4DCGPGytfDGjEVfOf5IotpvOqVk72xl8JQMlauPd0RTB1NkaBMh
	/e26tsXwGN9QnfxualW+ma7ygcGgMWEMVXn0R4rSJ8CvxoqrmywHumTkH+FNCmgu9SRf3hoCfBI
	sRkSkSFBr+twziWj5J4vQ4bKPW9B5A9ruPzP9LTLqisIw8GrutvBMh6QJuyOayiUgLKI90RQELU
	5uvI//4bSEy3TErb+DjuhpFZDhjnJc4Yw8PEutha4g7BQiAZhp01h9tKc2dxLbtayN3OSwOa/cp
	/k4lZ1zVIZNtYQGmOCKpZTp0KA7ZSeP8rFLpGZVduFlMNBrHb4mZclOfsJc2Eg2uY5IsJE/gPPU
	weDeiZf2xK7RdFkTmcukVwpxsiCDzD7Cf+3AowA==
X-Received: by 2002:a05:693c:2808:b0:36d:f004:ae6e with SMTP id 5a478bee46e88-3796721cff0mr1863856eec.34.1794567925307;
        Fri, 13 Nov 2026 03:05:25 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:7e8c:590a:782b:a57b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm7110033eec.24.2026.11.13.03.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:24 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com
Cc: sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	martin.petersen@oracle.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] xen/scsiback: unbind the IRQ before draining in-flight requests
Date: Fri, 13 Nov 2026 20:05:15 +0900
Message-ID: <20261113110515.147043-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <353a0b62-0396-48c4-9e5d-fae5351d6abd@suse.com>
References: <20261109122654.30859-1-yhlee@isslab.korea.ac.kr> <353a0b62-0396-48c4-9e5d-fae5351d6abd@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 11, 2026 at 08:58:51AM +0100, Juergen Gross wrote:
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks, Juergen.  v2 changes the code after the Sashiko report: it now
disables the IRQ before the drain and unbinds it only after the drain,
so I did not carry your Reviewed-by over:

https://lore.kernel.org/all/20261113110036.146860-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
