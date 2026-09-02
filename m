Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF9147FAF4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352051; cv=none; b=pc6Bi8RgxIEvXVC5t+gvycBAtFiSy8ijxM37uBBAsV4CWIDSSfexnEHWi0bpEgNej5Gjf4gbU6h1KSeLh554q72RmID8AF8b8F81LFODXcgl0kv67fNgEifCLYlFJPYIcvNwJT1kMzDQ+tRHICWX8cPXM3fV4nQh7M8g+iOwBZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352051; c=relaxed/simple;
	bh=T7D7BRV9AmiQLoNQZxocvqenetH82+NyI9QdJlXbvMs=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PcPy7dyOdoYKKxFYzMXflNT1uc6W+a+3e/t8rDj8+d9nJ8dHSvzgHvhsK2veCbOv8vXqxZgvRVPJR7v7arnVUUmv+v6/2xiU83Ycmr5wRoTmHJPoiffOKyQn0tmsHS2mdsoeu6UuU9mPsU07lTm9H6ujc7uLNnoHl/OWY4NdNnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POSS51+Z; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POSS51+Z"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c25b3c641fbso111644366b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352049; x=1788956849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=onNR4YiTBOlH5oRnT3jVpMfPGUF10f3AbbASBKcpeyY=;
        b=POSS51+ZCeXG1HJXqsgUMvCH1kZBcEQQFLSbGy0b1iq6IgctQSF+Ef5cWbC7mWCkgi
         AVnc62HcBZxJ2BRWurFrhjHTMzu9hcvwcmGx9s6jD+0OUKo0N4bfLn8fTO/B34BO4itb
         gWOCqxkojNHSMBj/YqahVDmuT2V2bZhO5zvupZ8UJiu67pY5XoCxEbmwDMEcfY5ZYCPv
         qURyht+EImKr3qGZLGOqn7Il7C5TMeVuzJuJm2AiXfzrGlDiv4SzGf2BP9eMxQP24Gwa
         w7/cWrjlIcMaZTEr5LxL0f+vnCvRsp2+CBGkifXcMo8ApUs0i+lQ7HBGkGXOVENH/VWR
         xbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352049; x=1788956849;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=onNR4YiTBOlH5oRnT3jVpMfPGUF10f3AbbASBKcpeyY=;
        b=QaQGrHWIen3eILcpemam9Ez+JNmofXay2dAOiKEh+vPqTf2YGkQPRXh05d/QR7MGZt
         hLNDfyVtMdXhzTMAYCPCxkvmDc0PndKrtehd2hmKaCeidS9C2MYPeZ5auLKEt3g6f9Pr
         vxvfLqS/b7lApDoFEDW2Vvt79gcpOuNAFhwsT7SYTbblwR5QdS9jTp1HIKCbkzjvDxqu
         pJWhiuihddl2hjNbYhBzVY4sU/pErm3p5YZ6UlBngdRygglAX9dHV9ikVx7UVcKuBKmJ
         5F5fZL/RlIoomXDioH79lGVOXr0XMOONF73eAVGnwCsAkyTFRcy5nFLlXXlQxWpTuqA9
         aNnA==
X-Forwarded-Encrypted: i=1; AKwUvBzGAXHnx9Y9dZcJ3ZS/RvUcWNllJhBYmmvhftmEdLdvQwFk+o1jvRoUHmeMPgDbc7fuWWFrQL8InxLsPIg=@vger.kernel.org
X-Gm-Message-State: AFuF++nd+YpiRt1/Dm4S1EYE7DvhG2FZ1pxHn0Jd/07ZC4qDvmI16qNg
	AHip+DSPoxGe99SbDXMXLIvqRwzkwjNrz3M60zDz4GLPVRqxrWG6DS1w
X-Gm-Gg: AYBFou17JMNZGz+UV3jLEOLN6t8F1tw+1qGDwSPEuIWDdJYWzo6Lj5RSo3lkRZdFIP8
	Wt3RpEOlr2NgIHa91SRsVFYxKXXk/CSXD03S8MO/CZ8nyPFYZwYpcTZSQEuROJreFkqk/h7Yqwa
	ngCKeaWPuQFamhGhTLxowo5y6h3thNcOnhXEM0JoQP6bCgp4V74gLCHBOgwFzt/tLruPAs/ye8D
	MoPzdoxPpZsTWZHBjnzMa6Rne5Y88O2qNigmVAFs9h1aZUNGA6sE5rkXzJCaG58iEWEASROczFZ
	COXNQKPXnQ0PuXSXsp3KLIc86T/yedkNdK2iJVxvH2mHr+PEGmZHn9XF3c+jROylTRxiaimUnIF
	oc8ZiFgdy43oxTJAU+RSdWQMaQ8VhGtvmhtVhEPLeWmXVbTTQ1XzmBqNHO4ENcFrGenwhzdGB5Y
	woEmEqnzRJMtXLIih/5LcFRbxc2oiJtGXz/LGDEbzG/y7XNbogXaq3iVFB8qoxY/DXI1UxGGK03
	OY=
X-Received: by 2002:a17:907:928b:b0:c16:12ff:dc93 with SMTP id a640c23a62f3a-c25d5509d65mr251492566b.18.1788352048529;
        Wed, 02 Sep 2026 05:27:28 -0700 (PDT)
Received: from [10.45.18.37] ([15.248.3.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d0089a0asm124886966b.28.2026.09.02.05.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:27:28 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <4883f76e-94d0-4266-bc25-bd60af1c14d4@xen.org>
Date: Wed, 2 Sep 2026 13:27:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/13] KVM: x86/xen: Latch shinfo mode in
 kvm_xen_schedop_poll()
To: David Woodhouse <dwmw2@infradead.org>, seanjc@google.com,
 pbonzini@redhat.com
Cc: joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 ankur.a.arora@oracle.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, x86@kernel.org,
 syzbot+208f7f3e5f59c11aeb90@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, suryasaimadhu369@gmail.com, lkp@intel.com,
 nicoyip.dev@gmail.com, frn1furkan10@gmail.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, imv4bel@gmail.com
References: <20260831213632.81023-1-dwmw2@infradead.org>
 <20260831213632.81023-6-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20260831213632.81023-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/08/2026 22:26, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> kvm_xen_schedop_poll() validates port numbers against
> kvm_max_evtchn_port() and then calls wait_pending_event() which reads
> the shinfo mode again to select the bitmap layout.
> 
> Latch kvm_xen_has_64bit_shinfo() once and pass it to both
> max_evtchn_port() and wait_pending_event().
> 
> As with the previous fix to kvm_xen_set_evtchn_fast(), this is
> harmless in practice for the same reasons: the inconsistency can only
> corrupt fields in the guest's own shared_info page, and the same
> corruption can occur anyway if the mode changes immediately after the
> latch.
> 
> Fixes: d518b9d0fc80 ("KVM: x86/xen: handle PV spinlocks slowpath")
> Assisted-by: Kiro:claude-opus-4.6-1m
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   arch/x86/kvm/xen.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
Reviewed-by: Paul Durrant <paul@xen.org>
