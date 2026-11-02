Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793608056;
	b=DwW2LGCXGecsfZnQPbjRkgHyn7evOm6q4y8lgnZYV12MQ3b0fKXjveKl+JKsUbzLnTUw
	 Xtos0xfKv9ztPC0FFNu9r91kxL2upEP2Ik68v8Pa26K8kP+dziVyMnV98X8iuUtAwvccD
	 aaoULz5fXJC+64TJ6cRO8KsviLZehax28ygVR2DyWaNFYBPz4AIpGwHxQBmwz9L4xDbeD
	 YkDiNcUOddodNF7Xjj+Qeu8/H4f6tIn2/w/DjMtNjM6NyHusmBenKc8amIKbZorzPgrrJ
	 kypRk0DRdUTVw3r9+8CqbHOytK4oOJbf0QIeaM7kMoKnmB5QkpsFxg54HzEEnTYpwcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ryxS+aXyH1s0wbz8aqQ7n2ujPhXRrOEtxD9s5b9+KhA=;
	b=HviuZ9l7peQFTAgLoofRsitsgXhyfkGuodOoeGNP/YpOt2BJ64PqgDJ5OQYmgJIAWQMe
	 d+Sag5kNPB2cxzT+/07k7yzaI2acw8yOua+zaEfGaunakRJkgZOWVbMuWlkobD1e/FZlH
	 xN09X1cMWiVYzvHQ/nwfN0WYyIohdzZiYqlmsL0qfyPPbEJAs5EX4DlbGTEuv8F36o/pz
	 9XLB6zzcv86xuZVKFumN2PfaYOKginC+nrtxgIDBGMs8CwILs4k02fnthoJg0Uac0BcfC
	 SNoAbBkKjdYUkGbxFZazJfHUavuQmp4QgjVv5FPkXkYMwS2+NPh87gAOdjugkuxvYBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=bx0SfT1L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4DB606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED4DB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=bx0SfT1L
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso394877066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:27:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793608054; cv=none;
        d=google.com; s=arc-20260327;
        b=IeVf6uTZi9QkXd992Af8lFo5bJb4YhR2cxhg+VVsWfk6gWva+9etqd6wiO1Mg3eTpr
         ixFRl4gIoQ1YwOAorCBO0wQwK71iqgSZGoQ4OUM44YE8FNZgdPEODeRne51u3SDRG4i7
         CuxElxtZYnUDBw7rRHGbMxbyKwOatWePAeTwTsIjp1R1aBfSA5+23fSDT+xdOlzUnMJy
         CciQ2341f9DL6qk9s5mFurCY9vWiBYJmDHKyIJ/afAjo+xotn0pxSUx+hu/KWzKNeGLX
         E8Jc9JCoLxkxySjOvInQ5CksFGc6HhqFz6b4v8+gKODwmO717Jkwfmaogu0GK08871+q
         9nwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ryxS+aXyH1s0wbz8aqQ7n2ujPhXRrOEtxD9s5b9+KhA=;
        fh=vMc8tg+MysNK9RRIjy0vErMdHO7/rWjbFFIKrGr7gD0=;
        b=fP651WFhstF+758jKEBekIN5dn6K/mSVCW3bQc9VXw1s9bneaxb88YYbEAJlAKhxsM
         Es5xOV5wannMiopUKYR+PU6Nnnytk39NhxtNlu7KxB7JeBdqwAQIpSj5DPrCsku+VF1/
         MiylJIPuO6EKNEDspSPUfgBFBUIisBxckQEmgS7SWGos+LHNq+nT04flltn4bKIzllB3
         dkbVFGyo0SBDaZox2aqXIxi9ptsJna1+Q3+Q+25idF2MNGWTg0VfFYUpzdWgNpuBL7uZ
         R3RlstBzHcSCVJA00o7JZu2d8/PrMiBa9pCCgLkyZ2G7k2r2ronsqoMr0IAw3ko9LgNi
         p3OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1793608054; x=1794212854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ryxS+aXyH1s0wbz8aqQ7n2ujPhXRrOEtxD9s5b9+KhA=;
        b=bx0SfT1L6pBzbh7ZAuh6DaL4Tvp609ZPjhHdVhhiwwTCpKaHS8LJjze9UHi0Drgt9z
         g8SXZLy7KuY5DqqA6Na8flRUlFIMgiQb7LDI9J10p//RZ87yEtXsgbnN/aAbRmTPWWzc
         xhAqK/xZQvSZRFAH6gRAobB1k9Qhbq426oLTj5hATLZkN7TyRXUAj1HpJwXz1D0//YDU
         SMh7tKAnHD9GTQO3QZmv1kCBKSKPx86p4YJDdal/MwY4F44u2PKCrFks0L2IMR+TLHVB
         iTQUNlzKJKopGGw4mk9SJeaxK/I2KpTctRE3kYNuF4RsC519mwznOPaqQfrCR5PJQ4Dx
         geOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608054; x=1794212854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ryxS+aXyH1s0wbz8aqQ7n2ujPhXRrOEtxD9s5b9+KhA=;
        b=xvbv1Mt7mERIP3UTPpMnS3237UAu1l2sX55UbQsiVsWfDDtlb8y46RCEpgxenIvWlm
         aeRX76NQkLb3ZNSFJUvlSi8Vyy78+b8vjErBPR8d2aO71fyf+TbhfigcVLsQqxdkihYW
         +s+mWZpgqufVFToTsONNwkHyVc6yh6Bq9jjG5pmPl8L8epNHXx+QhDFpL7X+XPdsd4BN
         rjWPdnxVKyZkw/E4emMAWxfMuc+qWeBKgkaK0AZhdPKwcUE6+PaVqI3aK3iysD7vdaSf
         Se6zfPa96GNIu07mAAJ49vKpOg/b4B/xqjk/C2ApA5bJMzZ3EjJqow+dvXW8htuwoGN7
         TGHw==
X-Forwarded-Encrypted: i=1; AKwUvBzoBgsR9Yan5CrH4US4jnygdqgnSxuHiBcrDPtrUNqQpgnPmt57ybBMGX+eHyloGa9eEjC6p9K3ID6j5fw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVAAfjxxhYFN2jzfZ64mBhY3AvHyf5dkYEteczMK0PFtv1WAtd
	J+rVpSkq8Lx9NMMLP3LNYCj08/ovaN6RG+1s/+0wTOyq8Bvo8IkIg8i4HIPiWeYJXYDeNbyATRv
	FUibXFNKCJUO5ETlckrGkLUyYaGc4uoCIpjFfJNiP/Q==
X-Gm-Gg: AYBFou2NvNY0DArPzZtbm7Bh6Xcta4aMSw0B4kwswkythSxPE8faSqJpBgoP4u97a8w
	ukh0Qs47x0xf1iQFsTzN+4ae2nEN4WfAvkYNk3B+2xN/WDDv5mAvAdBRaTDuoe9dTB6qvgDwsUk
	48T9Meyy2KG3lEqwipJzTL1dQj4/VGaB6hPyN9Vw+DvDBe2pWhUm9VOvToml6JyUw+kESxlCZIP
	jWG/wknUb6SmRpADyf5b0IoywLgBaaY+JRzNvQM9Q3Zjx1K45mnlupbsX/Tw82ydu9XAPxl8UtR
	uqIT7VcyouF/CKkFE/vZ3IVhVsN2NSIrbZIksLZhzDgQ3fOKxt5RsAFKE3aQcDn1sjWy2DLf/j3
	9xUIdIjibe8WauJcwLtKHWsHMXsc/30xeiIsX1dXF727+s+5eKmezg6oDDji03H5r/Q==
X-Received: by 2002:a17:907:e84a:b0:c49:901c:d9f with SMTP id
 a640c23a62f3a-c4ca7ad1408mr835701366b.49.1793608054397; Mon, 02 Nov 2026
 00:27:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012205447.2717801-1-max.kellermann@ionos.com>
 <20261012205447.2717801-3-max.kellermann@ionos.com> <CAGsJ_4zQh9HrvgaqD32_A=bSdqmPqP4oV_SxMXMEDBrHe4jjhg@mail.gmail.com>
In-Reply-To: <CAGsJ_4zQh9HrvgaqD32_A=bSdqmPqP4oV_SxMXMEDBrHe4jjhg@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 2 Nov 2026 09:27:22 +0100
X-Gm-Features: AclHuK-DaFHs4ZKgRnNWfWDrr2HTqoXucqchR8x0CYIHHdv-rb94RL4ugZac0MU
Message-ID: <CAKPOu+_coR4Z=cbsWOG6zgbSWGvmp4=9=uUphkC3TWTTGn0Pqw@mail.gmail.com>
Subject: Re: [PATCH 2/5] mm/vmscan: move code to lru_gen_{add,del}_memcg()
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 10:03=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
> T.J. series[1] removed MEMCG_LRU_OLD, i guess you will need some rebase.

Aye, will do if you decide the series is worth merging.

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
