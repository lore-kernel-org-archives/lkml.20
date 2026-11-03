Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793665589;
	b=Wwu6XvXDE3sIfmXbu7j6sLDEnVVC9IrE+SUD7ErPAYnO6z85QZrgBGGYhWhHqy/hRPfi
	 qiUDogEITr0hicsyZaiJKU9L9fxkmbzsCPWqGyfZS9j6QFbYmpWb8H9HGAuQNYDJk8tSn
	 lgDrf+NkTMk0jLVmlJw+EITjjG3nifbJvv6TfMGERZq96KI781EPrupsaAfDNn4+FroCA
	 zczSgDc+xapeEDBptJH3KdhPlPzdjQ5xCR8HuMWkpKojg+NJgIuqneJtMcXS/F1hZm+mE
	 7t6VldrQadQXOMZ5EecuA8cwlIQpO+AvsYvBvyBkmSJHjeEn14Tn3wgAzmVZLYmvpXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793665589;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KVUV1+mwK52vEYaTF69wDnDvl4/N5dnXbFTWcMNoPzY=;
	b=FuAZkfjNsCtE9MAIrYJK1j8DldLNNasajJdcdONYlmRJlX2hCbOgWRMzpOWz9hhEfIHS
	 wyjyvQh8x1OKCTQ5j/Xpgp/45mxD6jf6TPQ1FnAh507QpP7bpOp56d7i24pn7mTbxKIrd
	 qqhjy1UkTxS9zOEge5kH4K2M1yZlj0s93eQtYsdowXLHdD14XiDMP/J+AyBb/Psf0hB6r
	 od/gpeDS/iYxSdr9x/5qOtg0AArHo2hdCbjYgjW0mRrdpeM/e21muXb83oEBdbI/KFItH
	 /N29d4Q5v2J+N1gDeGK3B3HpQ7PGYGNU7m2PiXBL8BoBSvY1A2vFJqgiI2QDMbWFw8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BVB/PWvl";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwWQcrJd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35981606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35981606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BVB/PWvl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwWQcrJd
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K63641746037
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 00:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KVUV1+mwK52vEYaTF69wDnDvl4/N5dnXbFTWcMNoPzY=; b=BVB/PWvlG/fhji5T
	hTvL6LCPWNEYZsd9WtKha4mpxtj94caZ4gP/S2Qtl6Q0Zl9G3c21pmsOQYM550x7
	kjWciHXExx/IhVbEolWq6y27AoDR7tVYIxt+jqjlNJgLzum4e0PTiCSszZR2b8d+
	vbgvDnrY/qbcwuuTXMSrHGTF+M7kridZ+X82vEg5Oi7brLtoqwxyMPjdo9H2NORe
	nlHH5xPyUXAv5NpXYNRIAnfXmevDAZNo9fRDna3EF0azswSUH+srBTsLkZx7CBvi
	sFk7bGlN0XMSjFfEL6FnhE/LEVVFXpSvHnks0b9E0FxTfIzHckGdf55mIfv39h6S
	CriEZQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvuj1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:26:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6748742eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793665587; x=1794270387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KVUV1+mwK52vEYaTF69wDnDvl4/N5dnXbFTWcMNoPzY=;
        b=QwWQcrJdDp/aPx4HzCUSdGXyGE8AF5Smz0SN3qyOyKIsdrKBfi489HbQqM+WqRNTMK
         MZvhlMQm/ihOkmUSGV31jGTIMDg+gmOvrXU2A94a9MOKNzRjnCoXm6kXAnqO8utRO2ks
         WzYRrp+78V+FCIeu0/9OMg8e/nmr+86h9vU8lzqXsQtsvZjt0MbO18S/jiuI1DHjOtWs
         EmaeFWMUneEikT3d6siduPtXOPP8fYtlrF31xwDtybPJE3Do1bL3Dt5m/rEBbLaw50CE
         I5U6Zks7x9gd9A7SWIJVBm+NBuySroWPLGYw7/xsP7ndu4uj46Grp+zh+uT5ezJakEML
         +fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793665587; x=1794270387;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVUV1+mwK52vEYaTF69wDnDvl4/N5dnXbFTWcMNoPzY=;
        b=iSSQYJo+WDYGw13vIVzk62PFpUhMRqqGV3ZShoczQeMuvqGEeoNS4VGpYJfINyoq+w
         yS1GbK/oR5nLQavgbAPIf9sAg6gQA6Y8ZRkxYh5MGHgJ9nz7OXCaLHaSJMYeXOMKfvw2
         j9XLtQesG0ypPCA7Cj443SVxQ/Z/fp2/dI9zSgnNYCuEMZmIvUGGL9Cb7TfPlQcpGl2C
         cGcOKPwOO/D70bBSDdNnOXoXfTEzozZ1gplYg378HKYy8w8jVFdp9VfRSCrvNlzmt5So
         sYOVA0ErYuCgsKMtYZUq5H+nO/FgE2/pLgTvD/IM59ntlroCO8QJLH+WWFrGAVO75knN
         FiQg==
X-Forwarded-Encrypted: i=1; AKwUvBzSnAovsbWoId3IxE63L893Aa+NX4vVIJ35G0dy8oLMxAkt1Lf0VA+GANkSebefg9WkxBel8AY74SYCDXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I6LOc4sDbOPk8JI1rEkPUpd7esFeDFJ1/EPkvtlI85dnN+M+s
	guXq8PaUAjaodnb5+KiQD3M8LfYLRnM/NgX7sLZaC8MgyZRgfqtWYRf4zDDHVSHT8HfGpScgRge
	an2ZE0TSOLTK4RN6fqP/PlXb/8zzpAwGZPOnd0K2RlkU+3Qx6p70L6TWlRdZvSexjiRQ=
X-Gm-Gg: AYBFou0xb1N7K4lEnNsYhBObp/u2TcCehLQejJYu0lA4Idvp6MLTrP2oxSlrnL3O9Sg
	OFeStqFcxVj6BZEWk0cqNW20YhS9TQZWSX/pBXOkW4q6Bp+nMacSyrc71h9iRH1wKEcZane/7PE
	QFY0L53W91xIthpyl7Fuj/jiE7GNoXGt9cAyjm3JU+ylGCtxOIz9/F4Uo1MbLxO/vJtk/3K2fH8
	sixjP4l/YMXG5ezpp9e9ewa+GQpCPMcOlZIEMXs47IdCYQ4MbvFgMJaESu2psNOq36Mbq8aazOY
	Djz/K6fknr11VijhtIgoOoZS7TnZEL80eiMCJUQb031qEgp9XIYBMLcWrReV0HbZhvkFb94g9DH
	nUbTvrsiVmXunj3yP25257Oar/pmKyTNcupgrJIEWpCvslmN8BSDYzaqHgN5YD7y5fjlv37jfME
	GBfCJrVIPoCl4=
X-Received: by 2002:a05:7301:6183:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a423c8988mr16360472eec.15.1793665587252;
        Mon, 02 Nov 2026 16:26:27 -0800 (PST)
X-Received: by 2002:a05:7301:6183:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a423c8988mr16360432eec.15.1793665586499;
        Mon, 02 Nov 2026 16:26:26 -0800 (PST)
Received: from [192.168.1.148] ([68.248.129.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm39285518eec.19.2026.11.02.16.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 16:26:26 -0800 (PST)
Message-ID: <374c9df9-eb58-48eb-8447-b6340df37719@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:26:25 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4] net: stmmac: dwxgmac2: enable L2 split header
 support
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        lorenzo.bianconi@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com,
        abhishek.chauhan@oss.qualcomm.com, sarosh.hasan@oss.qualcomm.com
References: <20261015221215.1714047-1-sagar.cheluvegowda@oss.qualcomm.com>
 <179244898962.3135.12890405028818098249@kernel.org>
 <32fc0379-0c45-4011-a7ce-795c44594b89@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <32fc0379-0c45-4011-a7ce-795c44594b89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae92a34 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=djYDpCgIitZxdph7ACYjJA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ZIJvd-A7hXLYn3_D4tAA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 0VmYzVtfbYTMgmigQfGtfduPAh0v5aRp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAwMSBTYWx0ZWRfX/mxLjOwH1Lxt
 zHFjzscHL7n6NtMEeGO+hhivFp3Y850YgM4HMB9yk9Ziph56yoQZnL2r/ZxYKbg3S0BQDYQ4PuW
 6UFKdg0VAJASFzbbBSLwV32+thWq5uk=
X-Proofpoint-ORIG-GUID: 0VmYzVtfbYTMgmigQfGtfduPAh0v5aRp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAwMSBTYWx0ZWRfX4cQyIhthQjrk
 jRAoj+anvDAOpyrt7EVaBD7B9JB/BE9ymTaQKrRKmA029wWj8PG8fan/x1cyBDiSaO8s+RsqdQH
 3LjNbj8h/kuEi5fY2+XtY/1id7uahywzMS8YJ0DO29/9htDtD98oKqIcrMimA1k3Ufak8TievGw
 cghYGMxX3kV4JyYCfXbDhaQ0xlC28reJcNVXCTTzp+RYPLMtqcIhlmgQrdcL2zxxlXuCLQ4qEHP
 2P4EQkdim28fuS2i0maklRSKjkx9J/FzmrJZWI3/8woIczUZg9Bnk5wqYNyyIRUDYIJgQlf4cYp
 0blyCLxpbgsJu0zwdPQ2TKPCWaidBSySJwQzNbmwnn3rnTJ3fNnU2drFmDgbOLtq0oACSWk8lVj
 sfhAep5BxfP/KQPJaUJUhy77jZgddzOru/GfBStbxrtnGEfA4ejbRpQ8y0dPAKFqHNqHkvW848J
 sQBI2x+QVjBwRSz54VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030001

> Agreed. I will send the FD/LD handling in dwxgmac2_get_rx_header_len()
> as a separate patch to net with:
>
> Fixes: 96147375d49f ("net: stmmac: xgmac: Only get SPH header len if available")
>
> and rebase the L2 split header support on top of it for net-next.

Correction on this point: there is no user-visible bug in the current
code, so I won't be sending a net fix. On XGMAC the RX buffers are
sized so that a frame always fits in a single descriptor, so the
FD=1/LD=0 case where L34T is not valid is not hit today.
I will keep the FD/LD handling in v5 to follow the databook's "Header
Length Availability in RDES2" table, without describing it as a fix.


Regards,
Sagar

