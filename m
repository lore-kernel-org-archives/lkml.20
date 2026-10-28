Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192036;
	b=0pktj1wT5p2qEtY1E79xCI7vCMNdYRv1YEoWqNtCiTFqYCzEfRgOS7vkrnIpaMYSp/vE
	 m9sNblb8yvBWvNWbPa9yeW0nOLfMLCw0xjGjOYHekblaBcvPUI4VI+3Co8W1Ltbe9BbHZ
	 Tmtffl6F5Clzo2DIdTrmG9P0K4LLUr0LQBfEnuD9mEMdK+t/NlqaON69UgenelmHqMH4s
	 atXD1YzASx7wE2ygqcj4nzVY9xMbxt0VZ56OKt6WyssSPuylnfs58/CQfYf0un9yYpsEb
	 gmp9PJeUHQ80YpWzz7ToB9INOZDpgMyUAQRAni7+iX1U60ZTnkaDRZnmTTuvfrLoA6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192036;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CoqnDBMQTsk58UNlKztcKSz5PUsrNRLKuBrZ2TG0xS8=;
	b=RtgmWcTOypPaA0BnKE2cdx3tBPabTnRr+oum73ZKUIjwxECLOFME1GGi+BTsNlso2Wiz
	 9PuAnp804pvK2CHBwMQlbiK9FuBjUF8Lt6aNHJpu9dhIVpmAc/Uf6R0vuSaKb11v5aL9p
	 Pve81vZYg23tlIfn8xqxbJ3LIybJxVZGfEH1nKq9soQ+jauUELQSvQaW/+DqbEWBWlYbc
	 hwDhp81XBigl7ertE4xsgiQvJXY3timj1MuYxk6PxCdUsDEbyRucGIKFK5yed9MGS9/lx
	 HRDsBho7Ce3dQi2985mjw2nuXnzDR3NcMSCqtBJ4JULAxNqeRMfaD/eAH7yGjhszKZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lbYojVpw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E33606A31A;
	Wed, 28 Oct 2026 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lbYojVpw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D5E1F01825;
	Wed, 28 Oct 2026 12:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793192035;
	bh=CoqnDBMQTsk58UNlKztcKSz5PUsrNRLKuBrZ2TG0xS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lbYojVpwFCtzoYluCp+Uy7IweQJrFCnHFJXzGezGtPVZJdbeAMLrOTZlSXPvkqEn5
	 f2si0SWQLpQzQPJIXaEG+qIdAR0vofxLGns6UkEYX7uVkhxMlUYJ93GfmT/z2IPyfG
	 YMOpRXr7Ui/DpzZ4iuD8Pa0sLcMsebGhWadpl4Ir6GfvV1MRwbNLQ3W+GNYV9yQgoh
	 WVdjcyHufxYRLJlrf6vxzTOecxNRgxJSBk7lUgktp1u8VJuCNIDJLQmIZ5ZQp2HtP3
	 idC7zg1w8xFmfhqc81lfAUuPZBiDD/XWeXkGiggg9PkabJH4L/NsQOs/Wxa+XiTO4R
	 Nz5koAADfhEzQ==
Date: Wed, 28 Oct 2026 13:53:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: 'Bryan O'Donoghue' <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: media: add the Qualcomm SM8750
 camera subsystem
Message-ID: <20261028-easygoing-sepia-mastodon-c09f32@quoll>
References: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261028093003.722745-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261028093003.722745-2-xiaqinghuan@mail.ustc.edu.cn>

On Wed, Oct 28, 2026 at 05:29:55PM +0800, Qianhui Xu wrote:
> SM8750 has six CSIPHY instances, three full and two lite CSIDs, and
> three full plus two lite VFEs behind one camera subsystem.  Document the
> node with the register ranges, clocks, interconnects, power domains and
> the sub-block layout of that SoC.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

What happened with:
https://lore.kernel.org/all/20260721-add-support-for-camss-on-sm8750-v6-2-a5f841061d18@oss.qualcomm.com/
? That's a v6....

Best regards,
Krzysztof

