Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D253468C1B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142929; cv=pass; b=ABmOXVtqEGd4iSZdapeGh8iDVmjU/5leg+V9RzhFqpmMrdPuuFc9/5GTvQYjxxhMgJ3dtq22n21f2Vz5HljgRU1//eNZUSIRaFbGV/y9WHiq13CiJDdXWDUUW+IwdJq9adhOTtTuSqZaaSgjvK8LpUjlo1LOoWc98+pUZVRcaek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142929; c=relaxed/simple;
	bh=AmKjUS0ay7JelQB3WKs+EVXewL6eQix4nu3vfmLy+oM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VmygdeF2XO9CUSr/fPzLPN8TEgEuk6ppp+ERdlHbxg5PrkQrriAcNyjIoffGC4ZiSnyZhy2nbNMxvrEtgRgoohd2ggdzHB/MwPfkHIPzwaGiuPTZRntKyT9wE+k2coG9NepXfNSXkbHlkWRYi3CTMQzjSJ5Graal8fRqnPLIgG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=rWgoZFOI; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="rWgoZFOI"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35d7fa491deso814569eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:28:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792142925; cv=none;
        d=google.com; s=arc-20260327;
        b=LBxhSF6eP25d6AVC41MAxkzKrDYdHq74kK+c7mcZM9tBl34/1Mbizbz3k+fRMMHEiF
         jf2F3fDxX4i0XHK6ZoYcRcu87CD1jlBA5Kic0ocv0gp2Hmp76/ZRTbAL/rKSB/9gzGPA
         PQv3bbIHZzVExUO00Hjj8+C2DuV1NydCMQwFcrINCBHJ5zOdeNN4StR6EIVQjZXFgSOG
         BisOo3A+OGV+9wnj1O8kFkqFchS0nSZXvsIjJxfjwiP3T0sNLw4S1kawbJ5tzxT+DFqo
         l5SzyXBdO4ZH8PtW/93hUJts8Qz2zt1ZRx3oR4TbJwwkh2o96+yDneFcr8MbKq+DPz+T
         LjVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AmKjUS0ay7JelQB3WKs+EVXewL6eQix4nu3vfmLy+oM=;
        fh=ozeW7gLGQ/NMlgV8v0XaISiW/VAhXYse8/LdpRSdCRQ=;
        b=c3UEm2eUmEqo2KYhN7XxOrt7uTj2l9Ncy0Rzc1GVcef4Qk8huBF75YDlAm4NuXy5W+
         Y1LvJrn/IWXZEoQLBp6DdjpEie0RVR3xUs8BpzB8OKLHMcm7anQvYj7xZrVN5HxBr1EY
         OCPdfnrUGGWo9er+1cVUu5KCzkm2Vs4G/5nSrxmPVb/Mej5ZGrKzvnxdojIAZL2t3wl3
         VsgTexSlJ9ANolm9lPxICRqPCvidK9Zwj/iujzmiHiVnlL95AI4COjWHO+sVBl/8do4m
         Fnt+lzJEyorxBPHE7eatYoI3NOIqq828FqA3F1wAvMTZS1hWqCr1spt7LkT26kHe5c/p
         kP1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792142925; x=1792747725; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AmKjUS0ay7JelQB3WKs+EVXewL6eQix4nu3vfmLy+oM=;
        b=rWgoZFOIsGYNTdcPCqI1UBpcNgDM6iK4XabmpBNktpC+2RIL9Q7QvJ75g33Q1vmrs3
         jlVFtoKJNSGHY56MYrw0sx3B/i/tseUqVrks9CrP9RmhGyZk8vCken5WZWQdmxLu+31c
         jcXIVuowourWJLVyAMV5xNBWrHitgxM4mXmUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142925; x=1792747725;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AmKjUS0ay7JelQB3WKs+EVXewL6eQix4nu3vfmLy+oM=;
        b=xlLjPyIYKviQo39wyUS4DZgyiA3mnfC5a72ZjnCqGreOVkGakbA2OFdTBt+st0qZdz
         m0FZ5JcGvRY8UOBh6a8gmI295eis5tDwcuHwB05eMovvX/N2inOi2rZec1AVPgl4nbHY
         RUcsw7W3qpdjASX2CI7D5fvm/NujrdATwF3qrcnJ+ESUlEQA6Dk6i3NlG9vu78PqdNYC
         TEO5gx3Xa14EO0D22NYMG9kSqal+NYhgUagNHlDHK3wwnTtIszxodALJRjzJ9UaVo9lo
         4Ofii9r//b2cS08Owbi5B5SO8F3NLEqjmQu9pR122PQIlL5AFOwnB/RPKVMbkpDhYLHk
         vT9g==
X-Forwarded-Encrypted: i=1; AKwUvByuZXkY1Q/CQoikbR1o/HAADZEdn9hIPmB7MSB0l7JIb3VJMxam1Vg2dP9C97zHrB29Wx7xaLS0bxrjcN8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuKDmbp/LTLpIGf6RMC+Vl4m34fxAvxsh9oPLEvFZxzW2LUoSX
	TbyCMGOfxD9f14CvmSOhf4pyPfbaI+bJb4g/rrSTF6atLUgwPyCKFFpo133Y8sRxdrz5d++rgFP
	69Dr0PeQ3zuqGkSp2tc8knF/7ImLk/Pica+5joaDwcg==
X-Gm-Gg: AYBFou2uxCpqnekPa8kjb7BrOPk/N+/P60CWmHriivTxW3SRslF/TLBQO/AUr4i5mjG
	KdkeUgse6rFrgddB312wK9CrqgQ8cPovHsVocnhgL2W8rrpZMbe7cwC9iPx1DZFqOUnyZMzApTf
	fvS9ngDA7OqD76Zf10n8ZzmJu1khWElB34Kq0IeoxRdca1TsIZGtviBiLKpOpQgyVrBc2CMPWEI
	oOrxx3tgNCCd1fkw/ctV/9JvE4T7B9TjNRgzey6FXrPKnJ3JtQ3Tks5C9TIgO1+361g1tqBFuv/
	zxRVfJBgI0zvur5G7mx0GPpuHYZBScMAmaNFW3Wkg8aXE/FNZxldbL6KlEuTC5xYA4FUp4wjP5Z
	fGmaR+3E=
X-Received: by 2002:a05:7301:6f0b:b0:353:7f47:8168 with SMTP id
 5a478bee46e88-3602e69d2a3mr3111663eec.17.1792142924976; Fri, 16 Oct 2026
 02:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922081318.321686-1-fanwu01@zju.edu.cn>
In-Reply-To: <20260922081318.321686-1-fanwu01@zju.edu.cn>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 11:28:32 +0200
X-Gm-Features: AclHuK96WMdSHWqen9On0_lt8gWo8BgW6QbnTyh16O2fTHfi3XWjbb_9a4MR3Lg
Message-ID: <CAJfpegseUy1_sw-ZY2XQQLY3ic9ifs+ar3GsxtyY90OASXu=yQ@mail.gmail.com>
Subject: Re: [PATCH] virtio_fs: read the vring size under virtio_fs_mutex in ->get_tree
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: gmaglione@redhat.com, vgoyal@redhat.com, stefanha@redhat.com, 
	eperezma@redhat.com, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Song Li <songl@zju.edu.cn>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 10:14, Fan Wu <fanwu01@zju.edu.cn> wrote:
>
> The vring size was read after virtio_fs_find_instance() had dropped
> virtio_fs_mutex, so a concurrent virtio_fs_remove() could free the
> virtqueue first. The reference from the lookup keeps the virtio_fs
> alive, but not its virtqueues.
>
> Hold the mutex across the lookup and the read.

Applied, thanks.

Miklos
