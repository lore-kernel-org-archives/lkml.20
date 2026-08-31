Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3DC3DC4D8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168373; cv=none; b=Sl57yeGrcGrAbVTFdel9jnoEbfZxdkm876Hb+sMeSJ9OlDeMBhYXM9ym6evuaIKutVDPspKVqiz2IuXePyd0QuqkvzC2FiUEA54hGIy90rvQIAYHwHMCFS7TCeXDdEj4j+PrSmqvsIGWmiCj4t+FlQbURK8kL2mqlMrbzfIJJMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168373; c=relaxed/simple;
	bh=ttK06hi5jQ+IygEkiO3ryeZPLThCrdKZVEsLhx+wvL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dU/MD5b0E9lpT4ejBcNY5UeUoOoVIe+lmWbJuMpAS03q3dyV1xGhQNIrsl45vl0YfRq0f6iMNFm4OgDzeGMOS+TeOcKMk3+96A4IYhuexHcg3JrdEdnHC2IPX5WC1zd5Zbb6EejFZYKszrbikvIBCzGfxF8dfldsG2Monj2+xrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VANmq/b5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VANmq/b5"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so23616975e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788168370; x=1788773170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttK06hi5jQ+IygEkiO3ryeZPLThCrdKZVEsLhx+wvL8=;
        b=VANmq/b5SPFwmhLEUOe5BJMyaWJRU1OJXE1jypWJCJkwYnvewQv79TVHhBqaMnOy6q
         VqHHyn9qrMVEdQSrnH7ielKq1sXdg8SRdlDN7zxs5hKTc9Ikq8frg53gEKQggkT6oVia
         mxU0a6IgAjQu0I+sjhvvoUHOOtLPVQfUie9HnBT3r3UmQqe2wHvP7200YhhHMBWI8Ty5
         e2WmQeSAyHHbunu2GGdTcVbSy4TnOVGRXFr0nCI63CPw13uT2qXTUfcmPdj/iPmZI3PW
         rX67T1e5+WqQPTxxeh2qG1q3gTaNYXeXTC0y0BGmb+9vwbbr/ziodoFU5LNbKdzI5aa/
         7FdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168370; x=1788773170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttK06hi5jQ+IygEkiO3ryeZPLThCrdKZVEsLhx+wvL8=;
        b=Vu+aLp8gZ0r3v7dqWojdHYMO6cpmGs5kIcXUVx9e+DgBgdUl4+ZTM9GwEbNm48R8WZ
         L/Rdd03LuIONXnXIOykboZgXlyc3ZCaRZqmz3vPt+0iWZV8Y29PbDZ+yi6oPIYdoSofr
         YvKz5twajEswau2Ulbt96qEloxA0I3u89BUA10QzVPBCWwDOLtcHhe0hUZ4EA5cwt16V
         0bGfsoFLwgBsfjamNcRU14Dq/94F7v+n7vpHy0P0PWzxCfc4bhbGKq25acDYe54MetfL
         a/Pbu0s87npw4Qt5DRFhjrjLdBYADt4aPsFaC3MXzXeg0OoZ3CxH/bjcdQXd/WgPiQvA
         WJ2w==
X-Forwarded-Encrypted: i=1; AHgh+RpjAHbCdDsto6zbJ7ZZaDWzsJmkK3vIo2D8ikSzEguxFFgWxxmUFZS158/AqpO7FDAZdBE9zPjnNqY3+ik=@vger.kernel.org
X-Gm-Message-State: AFuF++nMBqJs8JMOypuQBr/wmnx3RTxb5jTG7VZqdtQPmhTHfrVrEuhT
	OI5CwFj/WxFnrpAcR46YihW6i/bYvtpwrkqqI1nFCrniEp2QZAwkMu7P
X-Gm-Gg: AR+sD12W4Flx3taRJzZN3pxpdWPk3y+gRefxL2K1QMBAIrDIqG4d5pSFezRsuB53GJH
	BcS6jS/E1LXX08A0FuH+rINlb9BARKZHkqZne/GeYLKDHn4hwufgYGUlE2t6lZnuHCuWyAMT4hB
	3uRO4nLo+reI/+SO2o36RmKzcG9G4eWPg2w7fE6syydPUVmJ97IXykFfXL1pSLEXeG+4UtJKmD4
	rRLySUX/eGXx1xjFt3WsxDz1r5264GT9ju8iGlvS1RtDQM1wv4A88nsYVUdTscgEXoBRDQZuicv
	u5kmE5meR1Wx2XShxqMTE1FefTJEGgr1FiUkYZmWlTOdMhNj+JNLjoHvk4UNYWbpPoTuUmzLHF3
	tpbnuzIp3KQf1NyRuzvuz2T0vkvRDgmiABJ7FqsG/3jlnSEK3DEdjSmsf2+W0/ljgxM7P/T+5Ty
	pDop1fgIKHitSDAftr2IV9qn1gh0qbvYwTPXNcMpiBmddyPlNb4sVwhYoHEKyX8cGwzX0aGs9C+
	A==
X-Received: by 2002:a05:600c:8b35:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-49cd9421bfcmr29162715e9.5.1788168370027;
        Mon, 31 Aug 2026 02:26:10 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49c5a903eebsm171374105e9.4.2026.08.31.02.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:26:09 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: andrii.nakryiko@gmail.com
Cc: akpm@linux-foundation.org,
	andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	brauner@kernel.org,
	daniel@iogearbox.net,
	david@kernel.org,
	eddyz87@gmail.com,
	kpsingh@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	matt@bobrowski.net,
	memxor@gmail.com,
	song@kernel.org,
	tasos.papagiannnis@gmail.com,
	utilityemal77@gmail.com,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH bpf-next 2/3] bpf: Add user memory access kfuncs for linux_binprm
Date: Mon, 31 Aug 2026 12:25:47 +0300
Message-ID: <20260831092548.42348-1-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAEf4Bzb9szFTDo5uUxLgUVD3qA1XF-5A7GZGxJjX6d1MYLhbFQ@mail.gmail.com>
References: <CAEf4Bzb9szFTDo5uUxLgUVD3qA1XF-5A7GZGxJjX6d1MYLhbFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> this is probably ok, but also we might want to look into having
> verifier still allow to dereference trusted ptr-or-null into untrusted
> ptr_to_btf_id to help with smooth transitions like this.

> Not sure how complicated that would be in the verifier, but that would
> be a nice backwards compat preserving behavior.

I have just submitted an updated version of this series that also allows
to dereference trusted ptr-or-null into untrusted ptr_to_btf_id in
https://lore.kernel.org/bpf/20260831092305.42062-1-tasos.papagiannnis@gmail.com/T/#t.

> But to keep things simple today, I'd just mark that bprm->mm pointer
> as TRUSTED_OR_NULL.

If you think v3 is too complicated, or that the trusted-or-null
dereference support should be split into a separate series, please let
me know. In that case, I will simply mark the bprm->mm pointer as
TRUSTED_OR_NULL.

Thanks,
Anastasios
