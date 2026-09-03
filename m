Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C0E442B2E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424836; cv=pass; b=KkmHG5z1o3OhpeylNGmGy9OMJeGXWtQty0AYu8xf5/44cw156jCQUmugatJLMQRRY8jVpp3t78Sn3nIuOPN6TwmYXaBl5uRKF07S5LQDmpMfq9ILvDof+MjuFgthALqqzHsanLicMoZD8rnIwcgl+RXVqfdXOCP3djl3Az77xMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424836; c=relaxed/simple;
	bh=38BlAFziRJRovARe8JKhiAbQAS/6opVLEcnEue1dsAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VIecMqdM25MuMgioB2+lo4bMUJQy0Gb2YWEJ2ynKPSk1hrJK4dHtQI4vZxTW09mULyc3fnRADc+Jazj4+dSlMQmuiPMb1xEOJkUpBNOnrq68osYh0Ng6r8/ojN30tglHtEw2CZgZBVa9PdJBglmAtQH0AYrXtVmXBiUeTxD5yFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=FqHXjw+g; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="FqHXjw+g"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso1774788b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788424833; cv=none;
        d=google.com; s=arc-20260327;
        b=RZVQ1IKNepZuyLkheiU3/v7DVDTyKe2rowpgBIkscdL8OIW+moWuGO5kaMzQfVu+1a
         80TaNGfIEbmYG9hoRrySPBbtNsMs6Ch5tPpOKNPRu2jv4F/nTQp4hksRphzuHHgLpH2A
         TuBEZn8ax6PjgqZAVfFDjcDLBBjZBoyl++oFXQo0K9mUQQKa/X6DdVPyo+MeYq6uelqI
         QXYaNXC8UyTBmeNpiA4/cl96kDVizcHH2pOeneP3fT4CPtwebsOkHAtp1xQNqao6WGfC
         3VT3970fMYLzC8bDfz1upqP6LlkDst7C3muFyQRyp+wjbLwfxrQEzC0l19o5EdM7E0yp
         7/jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=38BlAFziRJRovARe8JKhiAbQAS/6opVLEcnEue1dsAA=;
        fh=JJx1wwYrb2rnWI+yfOZwyOBjTXld53q5h/P/EVt3T9o=;
        b=RYBsTS5LRWiJgSf4qL8B1WFxdtgratMrBRCT9s2ZltHiJYABY5KwKccAmJF1gWAjz/
         IB69EIBl0rfjhhPoN6enaMImfmlbj1W8YzCYjqPpie+FimRCCf16bzA4rzJdwDfzMPgo
         yDYOB4OCDTwihKz5MWt7s35hxrvWFjTzMOMceZHSCstl+z0ZLBr/SMf9zBmatQnE8+Qk
         Nw1U5J0nodRHIJZBA2FVZDlQ0OGi6fL4SYwUWnFDnNnFaLQRVzNOJYC0zLd3g6a4Hx7P
         TnkVYgviifWsoj2UR9HaZr+JqBAIOko4CZwIZDR4a3ZB/5152isvO5MuelYnwbddhVQY
         2BhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1788424833; x=1789029633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=38BlAFziRJRovARe8JKhiAbQAS/6opVLEcnEue1dsAA=;
        b=FqHXjw+gP26NvhFNMvNKivkaVsXxicY1DBNu5LHNRMIOHsCQZnzLsEEMO0NgiNyEPY
         8jgoCn1O27S+TomujvAjfLvtT3IBM0dtj+saBVXKXT3lWhJB5ijIGKI37I+XLYOMXHYF
         21ozc3hWILrhhKIVoz91tagXMwqH7lH0QfK9cpFHTqxXoJKdmUwj/VQM5qKS7/AnpdJ6
         Fbeqj/CioGcIEO2M/R1eguLTOQf0hK6Met/hcUQlBQTETtdf/oVPPZPoeDL6uZNgLn2d
         2MXcV2wwF2e7y2DCX3goQDU60/qhkqekp+CvAFzQBNrBX7Jmny6yosnE/G6vVHv1V53o
         WPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424833; x=1789029633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38BlAFziRJRovARe8JKhiAbQAS/6opVLEcnEue1dsAA=;
        b=sgmxmPrV/J6NP1eSlcDckUcJeldgyS0Xa7E281WfcCkyVLnXDmRgIrQx5fr9K3Kc6G
         9zZ24hikD6aExd2IXVFFs3aScV007Xz/FucIsDOCReX+aWRmX72H14jwImZMIci/Lr59
         C4g3FxKX2+a/EqkY7Sv09aJBE8fCj5VPNiT1pzjCcBfk0ISUjQpZmcqGqLfYNhkvpJ5h
         f/M3nbVkQu/Mxnv9+IVyHGSOfgz4mOueRi8dFh3WmZPQNwVzggRcgan7k3iEWe/k6z1Q
         PEg3RtO6F2EeXeFvOhZMEGFYaKYe+dxECgm17QNlXWMUFyo6rdRYPqZH7KaChf5q7prU
         7cEA==
X-Forwarded-Encrypted: i=1; AKwUvBz6khf6nfz0mS5w69fdMj5RlHxbssCpnN3Y483+g/kXXF4YekEbFVHOQ+3epXAzviXwn3ro9WVD2+CgmfM=@vger.kernel.org
X-Gm-Message-State: AFuF++loC2RrtkjenUqAt+jDZtWj855NmhdZ3ZTcG6n+8a9/Iuvc9QMg
	endNYmaBFx3y3QtLT+YKyh5Gi3t13RL3B1D53JcJDqtJVIN3TiXzOCJC94wxhQcJOIPeRAbplYN
	Nrdg4vWmLknhWHvODK+GuygFXz+2mAo3zxycmpX7x3UPMYT194zSQsd+WTNE=
X-Gm-Gg: AYBFou2H+0MtFXiKp4r64yolCd/mFhzLFmZtH3pn5KpUvcgLaBlH8xzRY00JYwNq0VN
	SlIVXcu79+9eoCliUVhPjdDNeuKvYCWTty2IcIcgp+nh1OG03R5yi1Y/4StVEA/bhKOuT1X2MON
	eQF+W7qjfblhIV0vrDbNtZinXD2rGR7q2bv0gCW1au8gdlu01g5TYLa+0rh5T7dE/Ezjrc3M/Va
	VU9uHCDzLIn77vuf1MLwd/eZmf35shL0jVPC4Hz6g9G9lSiUynxTt0Zo4HuXwde1a0Zkr3uvx+1
	MkjkShzBGnMg66qJet9QsOjj2VU+VnUtgRDfhZEtUcOWhCWRDSavn0btLWnb/mq0j815jSNNDVL
	EK8ueaJlPWKuEdUfP3MyLHUsA4j9Z/50=
X-Received: by 2002:a05:6a00:4f88:b0:85a:bc69:bfc4 with SMTP id
 d2e1a72fcca58-85eced14290mr14693883b3a.0.1788424831665; Thu, 03 Sep 2026
 01:40:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828180322.730419-1-longman@redhat.com> <ba138f23-6972-44c8-8ce5-80de1f50891c@linux.dev>
 <85411b3f-bcbd-4a7e-99a5-49a465ca2df8@redhat.com> <CA+0ovCg3BcogTUuqZwboEaZW41dkcsAV3nWjENOHc5ZFGaEarA@mail.gmail.com>
 <fda9189a-93d1-44bc-8c69-766c687c0ed5@redhat.com>
In-Reply-To: <fda9189a-93d1-44bc-8c69-766c687c0ed5@redhat.com>
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Thu, 3 Sep 2026 01:40:18 -0700
X-Gm-Features: AcwNN1W9RlsfS8Yl1rcEPlrdH_DskMpwHeha43CLjrJglDGsBCBPibFIsGMnlDo
Message-ID: <CA+0ovCgvhWff6M=ta8wr8RSTNUhPcxfL5UyGQMi2bxo5LQorEA@mail.gmail.com>
Subject: Re: [PATCH] cgroup/cpuset: Handle cpu hotplug race in guarantee_active_cpus()
To: Waiman Long <longman@redhat.com>
Cc: Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I do not mind at all! As long as the Tested-by tag doesn=E2=80=99t imply
exhaustive testing for soundness and completeness, please feel free to
add it. Thanks for asking!

On Wed, Sep 2, 2026 at 8:29=E2=80=AFPM Waiman Long <longman@redhat.com> wro=
te:
>
> On 9/1/26 4:55 PM, Farhad Alemi wrote:
> > Apologies for the delay in response. Upon our run, the patched kernel
> > 388b607d107c07aaade04c7f22f344cab6bdccd3 no longer panics when facing
> > the attached reproducer.
>
> Thanks for verifying the patch. Would you mind if I added the following
> Tested-by tag to the patch?
>
> Tested-by: Farhad Alemi <farhad.alemi@berkeley.edu>
>
> Thanks,
> Longman
>
>
