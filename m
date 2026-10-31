Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793480417;
	b=IXp6zRw1Vb3mGLHsF6eZzvQvJ8K6MOy0tOgrZokFVpTA5Fd5HK9kP2/AxcOYa4+u5gq0
	 2HNQX9kL3G9zvRmwCoH3vBAPIREnHJdbgSfIQt997J2OxrE5gmdj0hB+pKo8aiwyUFsl0
	 T+tvBOdSLCYxOs9XrjyVCUJu5p+JtGpl/1ONOqXXpWFHOgYKZoMC6t6ablHR9clXJrjPH
	 qQvoSiUaiNEW/kb6KID+7nSYA/85pO/7KF4EnLiih1/VAj7FH69BlveG564T23Szg1wlu
	 zKD4lYHQo05XvRhmDG9/zYCnZun1PrBdsATlwnHv7Yo4ntchjFCP+6aPc0AUK47Ro2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y6zIttahEIdYZS9kXDinaAVVA8SQ2nKlICPEN84ZtGw=;
	b=1MUx5Nkux/wQiA7rZtAcGnxXHgj5Ira72DPlXVMccNFcxaCaH9PrytiKbDAh4oESqRoz
	 xBim5MenQpnHB6FPd0IWfk7SBonv8qLDofv8xE9nzY4M8RlW4hING1R5kS2240ivJkus4
	 p6+01IG2kU5Dw1su13hV7KYlGPa+SpU4lz1zmcQ/houSoa50/mCecPxvk8BC3OdyWUftE
	 slSsAXbhTOumzDFyI4av2go6Cwhv9J+7yIOX63GadUDR6A/w6Tgh/N+bySaKhJvWvf+Iw
	 NboCi47IJPEXWgke+LnohjrTAfVg9OovEo7lD98Ko/KxfZ7ZHRO8L5K962hMwCSna9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GY7d3K8n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D772A606A322
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D772A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GY7d3K8n
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c34bff61551so324554366b.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793480415; cv=none;
        d=google.com; s=arc-20260327;
        b=klhPrSp5YqVUXxK5ysTa9ulV4e/R7ynK4ZoMBfhb37wYC8Bj8ygLCVtGuLnMdh5pvq
         JsT9dI+lgrL48p/IOwbNJM8lKF6GQ5J6+uU7u0VF71lf1dr4dmp9h8qRO8kachqsPD1k
         xVFhzjgyNvPD9HHe2aDbdoC7qONnlAc0NT8RCfXQ17QgyrJQXaX0bqVs/j/ui7IPfo1m
         jsZ5d7E7K017b7YU1UzML8kom07AIW/WvXqn3KdyLmL6KA3Guc+j1jAkQnuWEElrWORM
         UmV84cHFxqdxP1UNyTT3ugT8WsH/u71tMen6vGahNSGrsNewffDoRlBoP/n46YfzKGSK
         538w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y6zIttahEIdYZS9kXDinaAVVA8SQ2nKlICPEN84ZtGw=;
        fh=7XINblB3j/Qntc4MRurruUqvqCqSAShk+4OVx6kIn7Y=;
        b=iIsCPXIcX1DAXGQDh6foAB7c5C9szNp+X8wBXeDE9Igfjd8faVhHk+8S2le+n+bkBA
         aqxVhCuYV4P+UdnBXSYaH8WVmJNJhH2yCzMoPc7Qid36esfhR1mV5CCFVhlT4YXClGCa
         Ix/tbFOBYvD7a1cqUzH7yNN72x8aZ5uJcpUSP8+yi/4G+xPZVzzpeTHpprL0+Af6IMaw
         qsZsdNtIG6TCdCnKjTmAyCiFHvuV8WK0yrLzpTeOBM5M/NTegJsfzOHh5jnUMYZLKBHm
         SIcgMfMfr2aCkwvaj0PkF7iZSksgfbcyHCEONKEVv1u6HcANNu2669YwsZIA+B+zjvgf
         USZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793480415; x=1794085215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y6zIttahEIdYZS9kXDinaAVVA8SQ2nKlICPEN84ZtGw=;
        b=GY7d3K8n6KRu6PVWUS6dUeYg2GJ1ghm6/TO6voYuyVpPjuUBFOK40fAE2Z1EGiZ/60
         OjBd7Uz3pycJ5ASIr0VItF88b4ImcedUnrb+kdt9ura9MerlNvF6k9ZO7i4L/GjQeIm1
         yNmsQHmWa057Z2vKw0vVnb0tg29/1FP+JGZCIoCxoNZvcnkIrZGqZhQ64RoivZDQRzMM
         kjSHKszxefOF8nY5jAoPFCBLKCFy4RGSfMHWNMcxlzEvnC8afi7L1jpMaiYdITqjob5W
         SXFaJ3VegHF1uZ3YqxoYy5EM602TQt9w8BcUhwmiA5TjO3tXkuH1TVV653B0JIN4DIem
         B0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793480415; x=1794085215;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6zIttahEIdYZS9kXDinaAVVA8SQ2nKlICPEN84ZtGw=;
        b=EVm7+0vz/9+rf7nDIGPCt7RbtgRFfwm+FOGGzOjEJDrIqucyHiAaoGiMLVzoOp+xSG
         ks0tpUBOiFOYUcqpfwPVnHgtT83tYO+rWTIc4mueK++pY9tSZ37quBi53SRn2ifgL67t
         cVGm6e6ZMsViehqVNrjfc6B+qAd/CJuvh7nqabA4iFT+GKALWsJOEh0ea1w1cvPrnGwL
         gpd/ql5+KlVRtCy18OQIWagG4TNEkTZShyNORcva0Q8EV9bfdZ9GVLHNtNl1X1CtNHwc
         TbFBwqleWCEXtDqx4oDOTkltJJKJHybC6+QvfH44YWrsI0Nl2pZwR+FBhJ1BN+aUqo/b
         4wnQ==
X-Forwarded-Encrypted: i=1; AKwUvBy93M37PL07snl6sb+mwsanFZlavvv4/28pKOFKXz5hinb1d6btMAsTic/akVhUHPAZ9MZZVVcPUzstwtE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3yPnRqZHXsIIciRc0nS/2aMXg5DHfQcAmGsNtpAURUDWgbtv0
	ssa8fRAFpv/y0TVTxz3cAH32ur2CDJv8MooUAs0osbhqQXIoIJn9BVLhV4gaeroV/KXnGG2mE5L
	ETDXswzu7OrYQv5tHRrbYonFowuQU1pk=
X-Gm-Gg: AYBFou2djMt+WdCYEhXR5duoupTAutXiV3TY56C2qdzpylf0vhHkxyXlCd7vCz1f/yp
	WV8cWL62cb1EtY7d2aH9ZOruJALSqjyGO8M2AIM6GGr/OdYiz8/P+p5Z719X4j3DvvoH1tCd1KD
	k9LgrqQrYsDDdNxJd87lIT0qm+okS24Ro22BrOd3Ji9JagnXdIEMviz5/LLFpCOnYbqiPyD8jv9
	1GmKIbN4JKiMTTdONVKbxcApQW2JPFkQQ4MWVuJxthYYx3nYqB6FU54YhzqT7gxzOclVZi9Wvy/
	bhyX4Gw6iE3e3/sISQye3ydh8CvoqzUUNmAIm0FJ9e8x3tsSXrwS7DpD9l5BpqgYd/5c9N9sAmN
	4eVVzctcOfwUmLz/3VexAQ1tP7E0+dxjxUEG3KXmUcsZLnoYuoO+hzjJSrbCvlEkiIKvb/Q2pp1
	3ZfPu32TQoy/eT42F5g+TKi7Xu5js=
X-Received: by 2002:a17:907:3da3:b0:c44:3006:5c3 with SMTP id
 a640c23a62f3a-c4ca7aa6b0amr512955766b.28.1793480415077; Sat, 31 Oct 2026
 14:00:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031160902.2540710-1-vladurares@gmail.com> <2026103151-sliced-showoff-9b0b@gregkh>
In-Reply-To: <2026103151-sliced-showoff-9b0b@gregkh>
From: Vladu Rares <vladurares@gmail.com>
Date: Sat, 31 Oct 2026 23:00:04 +0200
X-Gm-Features: AclHuK-cNkd1s3D8PvPfBGonO1MU2Kycb-9kxlB_CZJ_P-vkS65HoDyWknbq4Bo
Message-ID: <CALr6u6KKcprf6W+MsnPwZu+HOoHfTS3HQs=iMfG1ZVEwkypHoQ@mail.gmail.com>
Subject: Re: [PATCH] staging: octeon: remove unused cvmx_pko_get_base_queue_per_core()
 stub
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 31 Oct 2026 at 22:31, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Oct 31, 2026 at 04:09:02PM +0000, Rare=C8=99-Mihai Vladu wrote:
> > cvmx_pko_get_base_queue_per_core() is not used by the driver, so its
> > stub for COMPILE_TEST builds is never called. Remove it.
> >
> > Signed-off-by: Rare=C8=99-Mihai Vladu <vladurares@gmail.com>
>
> How was this found and tested?

I found it by checking every function and macro defined in
octeon-stubs.h against the rest of the driver with grep. This was the
only stub with no user. The real cvmx_pko_get_base_queue_per_core() in
arch/mips is still used there and is not touched.

octeon-stubs.h is only included from octeon-ethernet.h when
CONFIG_CAVIUM_OCTEON_SOC is not set, so the change only affects
COMPILE_TEST builds. I built the driver with COMPILE_TEST on x86_64
and it builds without warnings.

I can send a v2 with this in the changelog if you want.

Thanks,
Rare=C8=99
