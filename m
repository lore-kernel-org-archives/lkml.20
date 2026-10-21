Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792587657;
	b=hIpAV48MJe4B/2GZTovFJczp4J4rep0UmoDSnsaoRop8SoBhWLF7mXzztHifJY84zmXk
	 kAILZnxvou9nmEMroeeP/PkKivwtjHHsWkUbREQGp4yJnaywGR1tNODcFyKp4yfSYgt7z
	 bYbAk5DkWrUIyQTCHHd91gWsb1rnzT1TbZuNWlv7DaQEj70yQEZqi9zspR1fx0RZgW/0H
	 T0ZtDzndbh8ob899rEleslwbL64fx3Bv8AY8WRVdKbcORxyT6KczNjHyL3DZlTUkgnuWO
	 akd1l46wfMl+PmX3SKhZBCa6f4C6JSjOUjh0QbHQvNgD7GVBMZI/dYRZPnjpEq0/DfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kXoYys6AGDFdddNSuFyoTToCIugSJAhRAIJkUtxGkCM=;
	b=CFyKCn8lr7PPIsYlGWZoMLQStPrtaA0T/ZMM5TjbBvUCj7uihnR2TPhF62Et35XTNTL4
	 C3pndTjgFcI2u8rgRs/uNUkefAND1bqJqmZl7aqnRlf/zhjyCl28c+D1EHjF+5PuFr5f9
	 Lui/AVZpNBXcO3+ERAidktg/nH/nBZ0XCog14m3JSFf3SeSnAv3td4sqtWSUBwH6QN3Ah
	 9nIf/LN/49IcW8gWrdshsDPt61FHAJ3tps32l94oIh6e6WTydk3aQ6uNJ1dHHT9/d4PSm
	 3vRxK9hxNY1fOUTfVRLnM/sb6ukseYBdf3mRKCVSwu8vwLB8g1P+lvCXDkSiLumF+Sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ATuLUQhC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B6D606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B6D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ATuLUQhC
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so997120a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792587655; cv=none;
        d=google.com; s=arc-20260327;
        b=VpVz6Bdwen8PpQUqeF84fLNbD593E6qofgq4oSulxiYaCvsYh/gssssdbniyeiots/
         MlbJREulnI+2NXqL3BxtLHsvyUlvu3TDFVlS6XJIYrS0UrhLT9CJ0ET/KItRNVCJUc/B
         rpDtfwUlnCYKlln0nk5GRkEEMNbGFjhu+PxX5zzq/uT7SaQe697EuRQ/HTIMdu1lHCck
         vebbxweUQADautrkjWT0k8KQxpMqOrmSx/y3DUZ5Yw7hJt+VUaTh4HHbNqoWoO3EeQnz
         zmR2DPa2Dd9npkJPIVPzvQRuH1/UWv5bXes1F2PrKzcTRvCW2tPQK0NFm8UtRvPNWmSe
         whNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kXoYys6AGDFdddNSuFyoTToCIugSJAhRAIJkUtxGkCM=;
        fh=md2tLluEDHEWMvz+dEQZbjmnlI01Rczh/yVUuE/DF+I=;
        b=XOm96/ctZMOA4vNyHxh7kA9fviFMONkPVLMxoCcRUvYl+2dHMKwsmrkmX18Kw9RxxD
         eNBOqKTxJO2Z/rXy70mU8J4HSxRavbdKq5FgMpUSky9FacOooku3pdzGLBQZO/R8sCjm
         D7UZthft2tkTRvwiE/LRVMJMQgsxDEfyq6CRF802c/YY8C0t8FjJSASmdJsuymy5VBGX
         2jXRaJpv004GrQ4cBHMpFs/Lm1nvgYr1S06z5qQeoiOSXkwnqnS+r1vm7vnSijTHN52V
         8AvpLCs59olKdDKhB5AYe0xu+YHLfsuPAUDVpNO0lhdxUBMtVBMt2DaGS1fTkz92ClOk
         IC6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792587655; x=1793192455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kXoYys6AGDFdddNSuFyoTToCIugSJAhRAIJkUtxGkCM=;
        b=ATuLUQhCm7bNIC7Md6XGQY4GFQFK3oqAfo6awLZkDZVz5OvwY3So3XmmwcXFeZlTQc
         BgK6u3qgRI7hnMYXmWm8GvYPSVi3782HLsc5x9MxY5zGwodRLFAjVgituIjKB7igSnfw
         HkYxVqgGTrc5cbJcX8MLQnQ1MXbYv0Om6QUndvOcu/XjVIRX8hwCj47gXOVGdXEMru0I
         BRPD3BDq0VVn/hf9bKWIHRLb0UsfBQjmTMIVWtBLCJTVvLojZnoSUiWMxnQQj/ldGL7n
         eCXROZHcz0+5Bbj/i4GK+B1jzceI04aRQUhDIepgcD+2NA4Fkf3XPCK+2MPcL5tA5C0j
         MAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587655; x=1793192455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXoYys6AGDFdddNSuFyoTToCIugSJAhRAIJkUtxGkCM=;
        b=vcsujHvEQfWpbqM8gBEiLWDbLwDP/PzRYOJOKytSER68N/BRc+r0sPtyzL8UeN1Fbd
         +YjPt3h2bDfvX/RczGJ6mJXzl42/xqGp8xTZeTdQqWy8W+6hfaCxyacs46iRXXiRqMcf
         8szgwiRJA0fCvpiQwzlia7IwRqOtbGOZJ+EtVKXcY+wNrRI/noPqVeeqb+PNUcmygzet
         j+hxgfNMgrrmmlnKrc5K1IJpMKNuM43rrNIXvjkZ6ajJQglDRJYvkaTbcyAV00p5UQkB
         Kwgl4AB2MfudhnD7/xoZwa+tE+uEhljvEGR01uCDDujOElbr8bQYV6hqr/FvATC1nIOE
         UllA==
X-Forwarded-Encrypted: i=1; AKwUvBycbqDOzhfIQuGna44DyXciXHLDuvo1+QtNchbG6AmB1REIFVsEINj/PbmO/AzH6u1dyNn0Pr2h5SWAh/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYqiqUISKIRIkjrAwDtgo0ZYZPeb+TD+0FfiGqsMGvBKfLh6uk
	zb+vr/o46ujNhCOT/XVa05YMwzL5ZQ1SjFuFI4z2QktIr2zs1ctBH60VXrN46zOf3/q0MvcZkNR
	sLWqofF1gjnbuLtnD3/iV9K6hj4CQ9ME=
X-Gm-Gg: AYBFou1C1XfKM3nZEem7xmF3iRcUuSnf4TpD1ErcE+HeBI+purZKNV27XEHtugGFGl+
	nxF/BeX92BZoUEyZJ+d46LyDpiX61JCfKgfbebqU6vF3k5hXr8+CC7JhzIdPmf5w+ZTHj/aXCdj
	39BKctMcntNCoJJwfDg2DIGC7cIflZzWu1HeCWXT2Bs44S9Q+WC5oOXB05QsUZmaQ28f2gMe2xH
	sADdUNZq4pzBxoh989peLO7GBDSxyP3kg/rocc3rDGhfCGm2CxAaRwaBY5Wv1nU1EI6ZPYwfVxN
	epTd2oR+0bz06ZAoShWal6Re0iIvl5I2HP8AgYy+YCLgNmDETy/4+PDVz7Y02csPE+NS3ULKwdz
	z3rDrqpf8Zk2vpzpdtK/XFAN2OXmeWRdz09Lz
X-Received: by 2002:a05:6402:280f:b0:6b4:16fb:b9ba with SMTP id
 4fb4d7f45d1cf-6b416fbbe8emr581616a12.36.1792587653646; Wed, 21 Oct 2026
 06:00:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260924112858.51392-1-disgoel@linux.ibm.com> <20260924112858.51392-2-disgoel@linux.ibm.com>
 <20261021-erbschaft-gefahndet-erklangen-085a518222a3@brauner>
In-Reply-To: <20261021-erbschaft-gefahndet-erklangen-085a518222a3@brauner>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 21 Oct 2026 15:00:40 +0200
X-Gm-Features: AclHuK9WcoBrCyRwmmWQl42Ua6CkryoBn_QB6lJW1f-3Kmj5TuvGleJ2mOxIsU0
Message-ID: <CAOQ4uxgO5xW39SfBEfM5yS4uV7M6_zZu7kVP++bNwML2s6ZPsA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ovl: fix wrong layer paths in mountinfo for detached
 mount FDs
To: Christian Brauner <brauner@kernel.org>
Cc: Disha Goel <disgoel@linux.ibm.com>, miklos@szeredi.hu, viro@zeniv.linux.org.uk, 
	jack@suse.cz, shuah@kernel.org, linux-unionfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 1:56=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Thu, Sep 24, 2026 at 04:58:58PM +0530, Disha Goel wrote:
> > When overlayfs layers are passed as detached mount file descriptors
> > (opened with open_tree(OPEN_TREE_CLONE)), ovl_parse_layer() uses d_path=
()
> > to record the layer's path for display in mountinfo.
> >
> > d_path() walks up the mount tree to the process's filesystem root.  For
> > detached mounts this walk stops at the anonymous namespace root instead
> > of the real system root, producing a short incorrect path like "/l1"
> > instead of the full absolute path.
> >
> > Export mnt_is_anon() from fs/namespace.c to detect detached mounts.  In
> > ovl_parse_layer(), use dentry_path_raw() for detached mounts instead of
> > d_path().  dentry_path_raw() walks the dentry chain independent of moun=
t
> > namespace and returns the correct fs-relative path.  The path is
> > display-only; the actual layer_path used for mounting is always correct=
.
>
> I think that's nonsensical you might end up with complete garbage. We
> should think about a custom format so userspace can "label" the file
> descriptors instead? Amir?

I wouldn't bother with that.

I posted a patch (you will see it soon...) to fix the test:
https://lore.kernel.org/linux-fsdevel/20261017165103.2450042-1-amir73il@gma=
il.com/

"/" is an established fdinfo path for a "disconnected path" so I can live
with the existing code as is.

We could also label those paths as empty path "" to make sure that nobody
tries to replay those bogus mount options from mountinfo, but really I am
not sure it is worth the effort, considering that it is very easy to
see mountinfo
with paths that are useless for replay (e.g.
upperdir=3Du,workdir=3Dw,lowerdir=3Dl1:l2)

Thanks,
Amir.
