Received: from sonic307-9.consmr.mail.ne1.yahoo.com (sonic307-9.consmr.mail.ne1.yahoo.com [66.163.190.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE5621B192
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.190.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469175; cv=none; b=JLSlARdSLHzPEa0Cz3kjsQNkOvZDm0hf4+8bh6A/cob6CYOcMzNsSnEnybnRSuKZMsyzJF1c1hY1PnT6XwJ3k4LHjwxhdnVAG0Q6ur1n8g8+vGIIplxh/iMW00oBR0oMMcdqHXB/r/OkisgDSxwgYia8Qp+L+DjCGLWBgVYbu9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469175; c=relaxed/simple;
	bh=zolMd8nRGcAWgsKEwf3FjxZ5PawV48M8CP9T+7FcQMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPWsFIg0QcVfm2TlIpX6gQH9ge4A9xKztNs3Qs66bYbOcidTIAN3VoNBk3KlIQuKcckJNhx/yyqba8xqauYsvrpB1wlA+YGNQf4aaBKmRBIZVz9C5xVFim+nFBtgVojzpKMYLXM3Ptcjv+2OqcQkesiijiyeX5gjhl1RvkW4Fzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=KfyRorxl; arc=none smtp.client-ip=66.163.190.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="KfyRorxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791469173; bh=iQg+qDSaFZcEEJqwbkTCrNlTIGGGQw3WBkS/BVerAxs=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=KfyRorxlB7pfDbsUywI++XfRNUpmb6zoCqAKcIjoC9x5VoOroWxANxSLTWlKLoWodQopECXpsgtbnGURL5NTfY31tlloQsw8N07VO3Ng9/QNw9Hj7TpAWD2FpoYw6mH4rXmVM77Esp0MkVIZwpBgp76WSnN4vUeEyTh4PE1O+cqyZeNldHyNkjODwXCx10x+uQkBV7ywcHjvbfcLsNHIuHEpeCOcvhwFAFu3kovc7r/fp7OWIJS4lAZFwTdFT7tIvPIbTEDfObTn0GuxkTZxHlICNJRsofBrhg3g4v+mZCxGfSba4VWoF9qnYE9SWzBNVJctEW1CdY9JWRq9nJ5UBg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791469173; bh=es60gYXubT7f6aJ4wWbEV4OmqbShxJtxUYLi2aeYoEt=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=VANdhKRgqs2xh3AgtLZW5n2tb0hNDoijljS9hFSNcuIvaHNVXPjCIJlq2oU01ODbE3DLa/RsNGXAUWbFdnW3K23eq9CnlLYMU4CMl7K/Flcu2tnUacsWWcFpoyE+A6DCFatF+ZEqf0Over7dZ2MwWFuAQVvmTU4uWxqUX0hTYg0vo3lM4jGLhgL3Ynpk6fWjoWv1SnrHfjGqePbKqtMXbJJOoa3RYbHDTgRC9Hv404fUkUgyUiL/sAhHEbBNIynTXFdSZyRbReAo4X5lIobRGAIA4o5zS+kyJvpIN+pHdyNDTmZh4CX/6B9Urjl8T+iCP/mVrP9VkO+BGdYe5uynIA==
X-YMail-OSG: ksU1cBIVM1kBjAm3q5w9kEQgJZADjG2okbGW25LZcGND7OahJaR8Vi9wkKK9R7e
 _OKauMPdVatl8_PzAgshSOG2XuOZJqN7tMpc2euS1uw2zNt97t8SeE2jzSO08OHlC801PdDjDv2m
 RJ6aClh5Gm3RpbJ3nFSXAEtOpeie7G1xJuoWv4Z26ZLoPtmTVVeMSzB2Sk_DpARGPjzYfff.Gk5m
 R4MO6ZfSeRVfhB7xyid_MiZbfpLr5gYtmhvWrTnezYE_OD0gOy9mGAXowKhRA8eFmehjah6XVqc5
 zSQhzeiqo1GEap3Qm_8TaxMUWJIFo5U4zO4YUCm7t80CgXJF_udDV2wYFny_MF6LuvJBnQ4O1sGL
 IvxjAWdT5kNyVIm7N1nBP9TTAIyy_B0_uN7ZLE4IChctFWlX1sAhSFhHnm6SOp2ZmJgJ5BIJAoRO
 S5jOLdwbg.jskfWqfzXmZgXCz7KYmcvKB4U9bbRdPdyE2X2Ty9wEzJ9iY_vWWfWDunItubAjpKZb
 rMKcn7H7R4tHTIwAwHOJhZHAEwCMDaZjMl0cN.ALqnZl3kLdZYWCtV6gS_1DTpNVKHBWDiYYq0N5
 C88CqzLPF_WOfzFKqLhr7ozucKIC6FdhKpFUngyqV9jjtmi6rowJJwJtbssFZiI1u.P7IUMBltPj
 j.Huvxl3jFIaZeIS.9DLf.oWtoS.AQRkkadUboTMD1yQ4n5pWYCTSgGs5Zhvzvsqan0rRZmYOWPv
 BxnxWwteE3IhCpuroxH47b6UtsGbAcDoPPor925ANEgTIP8FW0wGlU9Xv.WpPgrWLvCMKuJsHhFc
 KV27bQd558swFF9E3JD._M_GsZzmaPW0zELP2tQwr5WkvjgGVUeyrIksurS62lXiqVKEo3gWpvdD
 n0r0dx2mPWfCBYNAEgIzIKXsNzO36AXPOE2_1L3GW3sonLmSArdy0N9Gu6NR.cA8tDBpcyDrrfpx
 M74.18cZy8v1n8A8GmByvg75a7Yf5iLP8QWCcPh1L1JKAmsMhk.l_fu9fncGBfg7bp7FR.8m7FQ3
 w45EdPbEBrFhg2_SqpFP3_u5u_eYvWF2YFRNQLQ8CZqUONOgkb_WMBiB2952wA7_Z90UC3Se_4HO
 wd3mLeD1NZNl9RsKpFrdl6D9dDy_6sGu3MFrOhUp4Ylre7ymVK0WgmmfgntMSZ7OKWwAjALDqFIj
 0DRQ4nnI8t2S1xgPx8u4dJJAbEXh5cU0q5cPH86Yn9YYnOV9XnO_17Wusl2iDmeRka.bQYdHj_oL
 aWoCxi6Z0qMIvTtmMRPhjhLAXh7DBiybGjv4ZMOW1Q_CvpUL9VASDr6Jt2UlXYOimUhwJDFV9w.M
 JvE11eH9heydkEffQBeB7iFya1F1.lznRPRmdfjb0c3SAkdnb2AzmD3JCHQE280iz.nGFy11v64p
 NA00Utaa2F.eaPyptoN_qvAaOAEAi_WTTYRDKN8fqm84pw7L2vmdl7dI5W5ABNR6BgetCJZI9UkJ
 VR5MAD1lOHxI4RjrrvWJWyDGiyPBCAvG1d5JeFNPOvkkd.OX17IQxi8rk6Vx2R4fXiJ4J.7SBRMC
 ZIpsdecJK5mQ_F8ir6dTidhfqBMJ.AtERHu0gWCleGd6eY.Cy5uLfCuFl.wZV2Ms24ySpirsdQW.
 UeCfXEOIWKisA9lOtoGndnrkfBGhm4fJe83Ufud3WPjeDhRCTtug_wzcfbNRitbY.nYpVrbgrB.Y
 1uTtahLOnB.jkXL7CMqr6ZnrE_wokIFfEtWNOmjMwIGF5votgWdMjbLxeChrLc5h8ojZyoMTvfhi
 Y.C8.kSVcvGKpBRdRTnawBRB2sOVUSjCir.FfN8bUE0sZjxpjPYsyASR2LoFoOY1NGm1N4U3fr9N
 ucjMz0LHdTo.GPnJXSlzFmGdWyES54yCKmIdKdoSXS6B4Fj4WMEXOfKe4mPkox26NONlNmO1pE.A
 FKTMCQ5JrDzGedIWIW._HrA9ZyNNeFZC97e6eFP.Lg.lh8s8775ey9T81ceeAe0r2g3a2h8bUnFV
 vnv4s5PID1_3xIqitogwPMSlwzWz8EbyvaqnIvnIONduzbH6xTYDX5eEyJz2cJ44Y.u0RY_Dw4E2
 rkSojOEKliWUkKgUTi.7wuXJy7ahBRQLOElZGSVqKBkdDO_kEl_wmYJnAdRYe6pS4BGp5g9gxtlm
 BrUpoYfptgOebbj5hkbRqnULcS.9_mgX7rhekn6YfABojgYQ3THgRQZYxtz6B1z4O41la9KxLSpP
 1s.Kkc4f7NpzjtDVnacff.Yb2UTbKTxCtFb9zPLDE0e1VciW0skEd4MUa4ynAHLK2i65ZMubKQcM
 I1E2v2mwE3zqOremHKGyShz9EPe_iMOeo8T.30GLbdkm2
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 34819d65-37b7-478c-a4cc-8944fb449b61
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Thu, 8 Oct 2026 14:19:33 +0000
Received: by hermes--production-ir2-5dd9bf4598-rr7cw (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID b91936a03ec6c33bf72d6b72e8e8f168;
          Thu, 08 Oct 2026 14:09:12 +0000 (UTC)
Message-ID: <fdddb05d-f733-4b28-9442-11adf7223cdf@yahoo.com>
Date: Thu, 8 Oct 2026 16:09:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/8] net: dsa: realtek: rtl8365mb: set RGMII mode
 for family D
To: Andrew Lunn <andrew@lunn.ch>
Cc: linusw@kernel.org, alsi@bang-olufsen.dk, olteanv@gmail.com,
 kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, linux@armlinux.org.uk, luizluca@gmail.com,
 maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <84fc7483-b22d-45ea-a3b8-3285dc357265@yahoo.com>
 <dd78e00b-c161-4915-a917-3b5694139621@yahoo.com>
 <eec36c89-b6fd-405d-a951-aec0677b149d@lunn.ch>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <eec36c89-b6fd-405d-a951-aec0677b149d@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26668 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 10/8/2026 3:22 AM, Andrew Lunn wrote:
>> +#define RTL8365MB_D_REG_EXT_TXC_DLY				0x13f9
>> +#define   RTL8365MB_D_EXT1_RGMII_TX_DLY_MASK			GENMASK(5, 3)
> 
> The current code looks at tx-internal-delay-ps and
> rx-internal-delay-ps and programs some other registers. It is not
> clear to me that the code you are adding here is correct when combined
> with the current code. Please could you look at the delay
> configuration.
> 
>     Andrew

0x13f9 is EXT_TXC_DLY in the vendor code. It holds 3-bit TX delay
fields per external interface, separately for RGMII ([2:0] EXT0,
[5:3] EXT1, [8:6] EXT2) and for GMII ([11:9] EXT0, [14:12] EXT1).
The vendor RGMII setup path for EXT1 clears the RGMII field [5:3], so
this is an extra TX clock delay next to the TXDELAY bit in RGMXF, and
the GMII fields are not touched. Clearing it makes tx-internal-delay-ps
the only source of TX delay instead of whatever the bootloader left
behind. I'll say so in the commit message and a comment in v2.

Regards,

Mieczyslaw
