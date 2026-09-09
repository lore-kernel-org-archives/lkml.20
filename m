Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E59356751
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940862; cv=pass; b=qnQDrydQ4JII6Y85IOly4zhgAMKsSV0Tcw1yjOYrmShUuHJy52jSOCwL2EjHWrzZGDh5dCoIKpmBiEcJ4ck7oqBw00NBuuiNRVgjf51xhMvyj5EKl28cIjbZD16jQimCQvnCVQ5A1KQ6N23e0ml7oywZt7qRZQBgPS5UhzyqQWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940862; c=relaxed/simple;
	bh=3ucIodV25H4f/E3Otu92DPDMc08uUsFK0OMoN1m35TI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=teCWXPUH99rFZ9Tph8MQhAoaOrOXKTgRxYhLHJnF30FENjV/opfmo7zio7Suu+kJpaqpxh6ku7+yFarFVYdNmqpBkycBcAe9xrQXN22hWT88HamcexbszDOVN86HrPpUiEkySyCqQAo1dWnkD576A8vLseqIkW55IWI3tuDdN8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAaBaJqV; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAaBaJqV"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b1b9c3af5cso4484657eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788940859; cv=none;
        d=google.com; s=arc-20260327;
        b=H/v+cDZV+iQMnhp2fSeuYR1sGxuefDvnwNm9LMigaun1unSsdLNzxz8Nu7XhecQy8P
         eBlZylf0nBhMxaRnplOWe3U/DWcjCQx6ai6IJ1StXFL5nVN0gRplUANnCo1jJQwNiPkO
         AcD+b8iJxpHH6IrxEA0hGfjzPynDr0Ibf01mjaUzYTvxK+bf48ny/bLrqD2Gv5D/CGic
         oqiqm+9yHmOJ2ID3DsOXL1wmAr5wDiKQU0p/DFZ8TRbjAnWSXGN2z6AzbnXhayplsDWc
         xkc6KM5udpuBWOakR9UlOuwp7B6OS8UfRMZWz6W6pijPHNnvxkAKtpTpeKtCIFlK2UVd
         lvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r6ojG7KkisYtK+a5wUQDcdWxUyw918+UeZlJ6dvtgzc=;
        fh=3Pi1W9DlYtxesWCYYG74KGHbdJFe3AijtyQFsngKoso=;
        b=E6FMvARO8VdBXZ6P26la7xzXpuhrxbIYcd90Z5mxK8xdBlfN61AnFNTKnx+lbDvIbF
         8DAZzMCENgu8LWaozGOrlhkFWnhGoK3RlX6UN6oQupSGySU4ubwNw0TzvHk9eZAbPEuk
         /l5INRhW035yQaVGesITQgiQAG7MR69SMmX7ysYEIg+NPOMefXptLVV60Sn89dj/QoU7
         qzPzSfhb4IzWZ3VmLk6IFbbb8mNOKq6wIIh7XMtpMFheYIDbSysPZZuCV+j5GvFWa5WO
         7/1x3UcxZAFY8m+NWlCwUmRPMYVFdb5wL12U3cCT3AAZb5j7XbblcSwxnDMUNrgbHuQM
         8YDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940859; x=1789545659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r6ojG7KkisYtK+a5wUQDcdWxUyw918+UeZlJ6dvtgzc=;
        b=lAaBaJqVFwbtvNU1Rpl1bxMI2XLo0Vl5xuppeTvGKoDuJ5gg4ffjEYkdMmv3db4bLf
         Fis2oWvBJddUyzFSamIMiTkFA9CWuoVECRCQ7uCqMVtyzUyYsuGm5SPp5eoXorenNYzO
         FFGrkL2lrcLhrafn1d5oxJjA5obKhqF1ouCj35qxH5nE9hpqkFzTiIVIyh+kDePGTSes
         wgcg3SFKpmrEUkaaqNr5rfzdKT5XktHi6MjoWBq2nz40bVXFYPeNwUYKKoDIVwLRYHbt
         uHlLfVmKQ9Yoth6pZL/RoOiV62PchVianvM3gK//4xohZLHQSY40rv23dW6ltPKH2Y9m
         xMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940859; x=1789545659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r6ojG7KkisYtK+a5wUQDcdWxUyw918+UeZlJ6dvtgzc=;
        b=podnXDGDpdL7sCw8Ue6qJwbDcHSv0eNhBqFdpzT1Ai+OckoZZLqaM8VIg5x7zG42bB
         aROKj3lMWfwkyHviPTolLRL+Ospv9EqBW5ZgSAOYL2fjfxFz01gsTLVzPQD5CeiQOpyy
         6GQNNPhiFPi4QUGUukOpl1lXqGcfDpxJnSreIGlbkAyfHs2x2lSKzDa0DU+LexTPgdya
         OrBJTJYWo6kqHqL6i1NgBS6Rzr0cAgQdw6bfz2wpIkrvoRA+exc6izUwRn/X6ytzw0oU
         vhlFTHXGeJ3y4oT0NDVhJsTWaWeBK046JRm2EcYSgsdqWbIZOVSTenmW2I0NxA5yrjAb
         MnCw==
X-Forwarded-Encrypted: i=1; AKwUvBx/CVqT1Lz80HZCGbx0TkA71gkiwYBMjiu7LdOhLAxBpxtAkKzxy6WIU9DLdbrR4cpm3TW7i+zOn6NUKSo=@vger.kernel.org
X-Gm-Message-State: AFuF++m77MbeCr7wo2i50VbqeIZSaYiADdwSbDEbzMhf27Rt/92GaNcV
	SRBry6AcqrtcH9eIvubvG8PbCcrJN3X0X0A5I7EgLNOcVEO8wfC5Ui7ea61yGhmSS/S00iuRBEW
	wibw4riyoSCjdY8gdyoW339agBBY4Uy0=
X-Gm-Gg: AYBFou3kjl/V4Q4URY8a3wIej7824cn6W0WuxeigU/SkfiWR4NvswzK6/VEu/yVRXzl
	NHxPzsd/7ICfZdgLRBJL7Dle+xEyf4hIw1fPnNvo0wXYFlD2Es3Zc/UsO8/fYzh1xFIVawKCb9N
	8YMyNwQUtTm1m3BJTuaIoM5sPfpvw6/yMJGK0x64TKDpaZfTF/5uWlZ8tGQ5YfHgcMaHyNWYk+C
	AfdIEy0Nw+SqexY7UZQUFgkg8zP8pKYShuw2G2xr8bcwcZ+hl2ickpG37ut1jjLu9YEUKIDX8Al
	Ic4nkNC9K/rCH0wRJucfi2DAC1QTKmr+F01FYt9w8k5azt9MBGeQ3lA=
X-Received: by 2002:a05:6820:2004:b0:6b9:2d62:960c with SMTP id
 006d021491bc7-6b92d629902mr12360812eaf.68.1788940859557; Wed, 09 Sep 2026
 01:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820123512.87236-1-duankeqiangcym@gmail.com> <CAMd06XfsK+X1xVX7=nW+U572OxnZp1vFyYjBNdr2AMtb2zgYXg@mail.gmail.com>
In-Reply-To: <CAMd06XfsK+X1xVX7=nW+U572OxnZp1vFyYjBNdr2AMtb2zgYXg@mail.gmail.com>
From: keqiang duan <duankeqiangcym@gmail.com>
Date: Wed, 9 Sep 2026 16:00:47 +0800
X-Gm-Features: AcwNN1UAqaMukPjOzxIcxUWiOmebC4V-Yq3pNFBbnlgQ8z-xNu3lccJjr6eb_88
Message-ID: <CAMd06XcQEv2ezDzRWcgccw53eXVcMPBqjGh--qZ5xFo0FA_pJQ@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: x86: Clear hardware HLT state when userspace
 makes a vCPU not-halted
To: seanjc@google.com
Cc: pbonzini@redhat.com, Chao Gao <chao.gao@intel.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Qinguang Chen <chenqinguang@kuaishou.com>, Zhiping Du <duzhiping@kuaishou.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping.

The patch still applies cleanly to the latest kvm-x86/next and builds
with KVM_INTEL=3Dm KVM_AMD=3Dm KVM_WERROR=3Dy.

No rush given where we are in the cycle -- I just want to make sure
this hasn't fallen through the cracks.  Please let me know if you'd
like any changes, or if I should respin on top of the latest tree.

Thanks!

keqiang duan <duankeqiangcym@gmail.com> =E4=BA=8E2026=E5=B9=B48=E6=9C=8820=
=E6=97=A5=E5=91=A8=E5=9B=9B 20:44=E5=86=99=E9=81=93=EF=BC=9A
>
> +Cc Chao Gao
>
> Sorry for the missed Cc.  The patch is at
>
> https://lore.kernel.org/kvm/20260820123512.87236-1-duankeqiangcym@gmail.c=
om/
