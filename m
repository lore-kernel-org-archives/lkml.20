Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC0D51614B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026942; cv=none; b=bqMaQ5cHql4t9kzUHgXUsbTKx+L6fkjcjrmRktsxXZOFLtNkVUWtPuAEWuun1hA3EcPHr5I68XGwfKZMfFvVcOYU8lE7hcbThVUewE8N0QGToq+mk3MGxRTU5GAWqMEuz/YJZhfR3pPs75Ua8cx4hrz9DoAh8xit3gyXz9TufxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026942; c=relaxed/simple;
	bh=S0F59O00IfudgmumFPj+8WjSRuyfC/75f3Pd4lPfDxg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=X3++Zr22UgwZ4R/Je+EcoKDrKW6GSv5hRfP8SuobczZ9NyVGqAVBII1qwquq6wJO2fZaoV/pkILJQFIvCAVAwDOuJxIiLq5zjIDoOR+DrlzEUKOjtwEiVWCF2ZTbxA0DzAJ12334RAftWaY/W1Ggo9aFIa+lHM96G8dPi1TKN4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNk1vVLv; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNk1vVLv"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso2700404a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790026940; x=1790631740; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S0F59O00IfudgmumFPj+8WjSRuyfC/75f3Pd4lPfDxg=;
        b=gNk1vVLv5a52+Z3Uh1/tiWwAS3QtjG52Zn+lC0xQd/EGBiwwEUyV3IpZPUOoN8+I8L
         stCzQYnbtOehg4r++Bl6Gl8cM3tYuLCLCWXDEMYzKJVdfjBtwD/C/ODG/mdOBnx99y2F
         OCtiREtVFDn+oQts1L1li0UILk83745P48oab8Kz7lCiB9Xn6/Q1TeuxPdcvxjArKUf1
         tVizfrkNHQt2cOZvwOFurYQNfmpMPGSPCPxsz9Of57fDzb1Z5bEQs/p8YD9M+JD/Fn5Z
         uazoO6yzXO2fYC7RRlQ9j6+aeT+5pdutaHXzBNCRs49cRrk9s7G1UPlS7c/AD93mWeXs
         K0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026940; x=1790631740;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0F59O00IfudgmumFPj+8WjSRuyfC/75f3Pd4lPfDxg=;
        b=wAb0UovQwb8EZisYX7+C4OlEH3olS41aqhbQ2EE39GFhrQ7N7529t3LY2y/hsPWJc2
         ffphUfGvWhDAR+e4r2zzk1Af1Q1w1RwWlk0U+vpdjNTb9+gwnKuavKr7cnYHluglWVm9
         T9JfsCHuUaY89O8zL9L/O0m6QKPt7EkgAZ+MO5WpCkxDxS/4KAmbgxym9vT1BNTnUv4b
         EUx/l0DtECioxmuDkbSiSQkEBw0nC5Sm7ewwRvVnHdstzKb0y9RWgUYLbPlfd9cntCOH
         a9qD1FlpKpv6wCGFzaTDiTs5sMGy6Vu7K7tPXwiAp8wSQy2rHdAuHMIDfPtqfKzs+2WL
         gq4g==
X-Forwarded-Encrypted: i=1; AKwUvBz6he+saBAceMbZRB42oFjqttJ4fCJO2Dt4ROereWkqspZXvswwrgX+3meWOe5LIGHzKQE1ZDyyHoN+bO0=@vger.kernel.org
X-Gm-Message-State: AFuF++mcNHZuwVsxb911JKaRb3t2Zkszyxfqv+vm+p0cM/d/1fzkjDXR
	wZZJgZr4TE9lpRwVf+g2wDc071XV8iPg6vuUCGCHXcb7F7ryNuhqF8C7
X-Gm-Gg: AYBFou2TcJ02iRC5/GryzZMohXKU/poCGmDiYlzH3Q3GcdNq2XuJqtc4TphWzugxYQj
	z48IbFjxqqMPDZuo4vVOSrC+ywB/W2Jm1ycnaTM0qUV+TwLbzyaXYgnDqtewhDpbwnnCttlN+Mg
	JRXQLop6ebdxnBIdZVjir/ZO1XmaKh+tUpcQ51B/woC8YQ+Gou0ky32CZagbp9aByO/vrwBeGmz
	yFubIslhnjVUJxGkvCUDKE7YHMw9WZtyj/BndwthYc+8u/3d07043rytzsjnCYYzyTBPovNF4J3
	x3HAC23c7Enmbf1ax7l3lth9IWASClAL67sUQqs2ysdPRdLlt7lPjBXGTtbY1o8cc2VRb53sefQ
	akawtFxAS7hSb0oCYI9+FUNJ70y4bE2y9QyQozVe2oeszqqWZ+iGuEqh5W2uW6xwHRblIhxWrlh
	wCIr90CH8FmzK1sAcEXzfXJLLlck4pD3Zn8foNTnubDSgKs2MP5Ld/iSykmL6aNYuzq22m6VDRn
	MYFbUq52R1Uk922hAjKGNVuiMKFPB/LrqVclSHdVIE9JEkBIJY6QsoJ3mWk2kmPzn11pmT1A1m/
	wQw=
X-Received: by 2002:a17:90b:4ace:b0:3a0:4023:bb00 with SMTP id 98e67ed59e1d1-3a04023bca4mr6180002a91.46.1790026939659;
        Mon, 21 Sep 2026 14:42:19 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a03bcecdd2sm4134180a91.1.2026.09.21.14.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 14:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 21:42:18 +0000
Message-Id: <DLLBLB8VWMGJ.1YXGT94V6NJ5G@gmail.com>
Subject: Re: [PATCH 0/3] selftests/bpf: Fixes for out-of-tree builds
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Eduard Zingerman" <eddyz87@gmail.com>, "Nico Pache (Red Hat)"
 <nico.pache@linux.dev>, =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>, <ihor.solodrai@linux.dev>,
 <nickolay.lysenko@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Jiri Olsa" <jolsa@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Song Liu" <song@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Martin KaFai Lau" <martin.lau@linux.dev>
X-Mailer: aerc 0.17.0
References: <20260728-selftests-bpf_oot-v1-0-05feb15d94db@marliere.net>
 <6f95ec90-194a-4304-9673-c7bb50065223@linux.dev>
 <d3a251acf5131bea732e23bbd135a5fdebec9ad6.camel@gmail.com>
In-Reply-To: <d3a251acf5131bea732e23bbd135a5fdebec9ad6.camel@gmail.com>

On Mon Sep 21, 2026 at 9:04 PM UTC, Eduard Zingerman wrote:
> The "PERMISSIVE" change done enough damage already.

Pls do a partial revert of it.

