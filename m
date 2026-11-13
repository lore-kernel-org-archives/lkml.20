Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794591103;
	b=iadhCXrfNJqbrBSnnEbYTMBwVQTcxIh0iJu/qpElr+v8Uk9HRLzjqY3yP/EOkQRnJ+kQ
	 zMNbYQ2brfzOV+YDFZlq1Gj2qPDk5GYJToAf6nrn4AgR7DHaBAfpMrSwfGHqX3dO/yQg2
	 RqStcMdbEHzsutzPY50An0M+ONEaVsxPeiYb8C/IEePCWpA6Tl2MX5BXNDgqYb1np7gnI
	 AofMRFQpwss6SOW5t7P689iIl0HQKiojAJ0+w7rUs+fe284gnwHEHkwVjvIg924mbBxY0
	 sWHXOySWtygkAIKae4vczUlV7H1dSUzybvo3JkOUoCYTC49tNFYZrMvqZTI2qV79dYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
	b=I0u3Xfe76IQiTR3ax0QxDXRN0PgzP4GTXzBZW3dEqxtz8UrAS+cAPT1a2RoCaoODs1/j
	 HpPU8Z8GNgYXNPopnX3kAlmi2HaHedbq+jUTSfQxqlYgKxckz/s78WIQqnvRbu/QN63kn
	 TPMFoc1N7AJuFV0OJxcY6TBkzYbiwJkehX0o32kfuNppxZmfI8HChNSxUpO1Tnw/mMhT8
	 T35CJO0KAqQRcKTACADYzoJxQoKsz0C8AL900+Hm1atVQL+m9QzZL9QlFc7Wp0x1OwI8O
	 kouI8d61Ptb1br3FQv0Kuk9C37QVSyhldH9FjKx/K07UAj0i7BT2I9b0XXndPoAw8ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=le7K08J2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B73606BD0E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74B73606BD0E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=le7K08J2
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67be7b9abc8so1004655d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794591102; cv=none;
        d=google.com; s=arc-20260327;
        b=H726pOfzrdarPxx2K/zUuyVAGJGKQQnWSPgdhf14bBgl2CIbztCmkNkwD+Vog/4PCq
         OiLDXUB1ok1uEQ7b+bA5TH5e+fu/9iybF+bVbLawQbiNqUfvp7VwNBM4d5hGU6xrowFL
         h4faWClTInBvT/uFeFZm/n7tVb7oc8BfwuoeC08WwrNR00WI4f+vkHNjI5oWuyHzflso
         k7NmSJRuG+ZRMMJpGZeBhjnHsFjoTsTnEcpcPblFIxvriYSySJqm+jFadd8cTzWTTvn+
         U525T42TLkQUkgdYdjT8tYBUEjIFLcecTW4sTIIg8xPeA6YfdMt2leQoqLTesBHdor59
         f8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        fh=s8Q62OOw00j+6ukpUCk5oY9fCczRCq7zf9UgQLWKvrI=;
        b=b2FC97Xr/M8I6U8KkiJ0wgpkqGgWvaeiz6KJ4LvgEhAJq6E5qJaeAW2ctNG7KkgdCa
         WolptBV335wz9i8q3BXXQQuWL47iTfmXUSBvx4P0PADmCoWgLUP67Ywalzv9JDfhdO0o
         MU6kLEXimNT1RQv4u3Rf/jd6I4hMle+Ahf2A2DxsoXfOsWqcvmX5T0/GTZx9Wxs93VPd
         UoD9Sn+8AmywPjn+coj5BQBe27RqCTTLa0BTAXMz3tvA5KiZRWSCEeOiK0RUXPdGodEb
         NzckjgRE1jeWnTqGqw7iGAgoveE+whUW4q5a6OVmzJpXeeICvjGvbmhtpUTvm4jybQir
         KE3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794591102; x=1795195902; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        b=le7K08J2bA9Hr/68cdqwbf46C9tMiphP0VQXGYffptEgLGcYlBKFs1xCYmmjfWjy2E
         XIszWAT/7Xhu4ghnVl3bc/lkD3OXCS+X+Sm9CF+iBsK3mKNKSdMaYb/9r7sGzSB1TqX4
         00vaf2a2WnZQMW1Xe61TFGa6iALCGdNBSUY/M2ghQlI3neAa9DiyMLIG7WIID9pwE+XF
         M/t3wHfr+NXVnw+PnTtamguLyZXa/fpwaLUAg4I4Frca9/0u8MW0fZ0xPj0dCGmRxMrp
         OeKijB7gk77FddFRj8+DPtNF3nc5508pL9LOQe+rsb5MZGk+5Fd5fWLJtsbl2ke2sY/d
         uMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591102; x=1795195902;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        b=u8rq/YK/9zlnoU+GNoYFtFkHWapEUAt9STduvI9s42sznVlEgwjtJBXSt3rbREaMJe
         PrPjRHx6ZI7PuVfz0UpYQA8uVlK+Y+tGYQYCeeTl6WdF4TPJynlej+0XiP/VCrso7Uc3
         bz8Bw7IWuVGXxtkyydfDaI9/N30TSfujXpvKUgJw1Ah+cYMugbUxGtech4L8+QhavHM/
         YmQPj/1pLggMc+9tjJXeO4ml6DUpuO16ytBfcW8+yndBjot0UWKqRxchPSjndZs2FBhO
         oSF8qn7HFzZenDV29g4JDE2DjGsX5aSCYE9zqs6oK8eiUu2WkXbFw7br3jvqarL6hd//
         CbAg==
X-Forwarded-Encrypted: i=1; AL+hErHGt+Wn/mM2PhAhRI9KhlpRuk7DkLGp/tIwV2a0NyrLh00KLNZunU1BEbnEwTml/+7CQ/BiRKn8Z5lJoWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M1JmN3Y93vu3OiK4Mzj5HCgzNrvDq5aNCmF1GnFV6KvOOG+tq
	nrXyAE181Ky1wUsZeynixGiV3utdwhQNQjmP/oLidoPpNPCKDUtEUujcJnTor09qn/vNVrzbE+A
	wZ2f25GnVl2BOhgkiyDbMseGIt3uf9c8=
X-Gm-Gg: AYBFou0IoWGIB/Wybz4rkSAgwg2cnCSg0NdVVLbEsCMZu1qun3HW4frVxroy//x7elA
	vCCXBbpO84g6Ln6ZteX+DWRvTCsfmXOl92nkCLxNMfX+4UulDIEc+UdmAvRBSyJouk1qnnVtq5t
	dZfNhOSLrQjXNO3+3MKkub+TPZaezivP2QDZh+1MznAOeX4aAARFHaJ4SlkyGEQVQvoQmF/cUdr
	wBIFAIYspv5yQCcwUu8189gvjVOI2ikSCQsweAeIj0VoWmF40nWKwErnA2tf4K8txc34I9wdv/V
	bIs6Z8DDvx2b7Up34YyNEZveR+e6T28k1jHepLhClOj9sSEGzO/mVSU518VbWl+j0vztmnRMQpM
	QqUigRTYoyyWrJEQf0NifT4szEyOfKvauLjqMeS4OvNmsDgYcpAbhZfTj7FdG41DdBxmd
X-Received: by 2002:a05:690e:4510:20b0:675:47ba:2183 with SMTP id
 956f58d0204a3-67d89709f2dmr1486987d50.53.1794591102378; Fri, 13 Nov 2026
 09:31:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113003217.197757-1-ansuelsmth@gmail.com> <20261113003217.197757-11-ansuelsmth@gmail.com>
 <737e3c57-9aad-4081-ac75-f79cb2084349@kernel.org>
In-Reply-To: <737e3c57-9aad-4081-ac75-f79cb2084349@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 13 Nov 2026 18:31:31 +0100
X-Gm-Features: AclHuK_T9pn_LFNwcoFkFSy1mvqcLyRF0a8TMF1gVMEOv5saT-u9fzFGXIXxZrg
Message-ID: <CA+_ehUxzPo--g+Ksd_0xJZo7_bhYZ-B17wG3OyGtU=3aa6B+WA@mail.gmail.com>
Subject: Re: [PATCH net-next v19 10/15] net: Document PCS subsystem
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 13 nov 2026 alle ore 11:52 Matthieu Baerts
<matttbe@kernel.org> ha scritto:
>
> Hi Christian,
>
> Thank you for the patch.
>
> On 13/11/2026 01:32, Christian Marangi wrote:
> > Add extensive documentation of the new PCS subsystem and the fwnode
> > implementation with producer/consumer API.
> >
> > Also update the sfp-phylink migration guide.
>
> FYI, the Netdev CI seems to have issues with this patch when building
> the documentation, because a new warning is visible:
>
>
> /srv/nipa-builds-contest/testing/wt-doc-build/Documentation/networking/pcs.rst:3:
> WARNING: Duplicate C declaration, also defined at networking/kapi:486.
>
> When executing:
>
>   https://github.com/linux-netdev/nipa/blob/main/contest/tests/build-doc.sh
>
> Logs:
>
>   https://netdev-ctrl.bots.linux.dev/build/doc-build/results/909345/
>

Hi Matt,

thanks for checking this... Yep I manage to reproduce and I fixed it.

Will be present in v20.
