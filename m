Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228470;
	b=tBbz8aUoMBNPheYdASGAXEaFGi+AXQgOmQgkoWe0dhcbd7scQFHd1p57kJeQwPH8Ja8W
	 j/NIlTCZ70TVfOW8tq5/mfUTKXJBuuYM9jcrkO8Ay63Q+p9QqXfxYVUkXCJuvZXNp6LYd
	 GwbwlYP9jgqzBZI9touF6mJ4dyn/mRY+VKYKZnjcktA84/JUZdb352Ye3nkSkqDMF7EH2
	 vDvkrpGFUDQG5ACXwfpPToF8TrYKVMcoMGaVjLpXYVIrQWJlFb394RXqoD2m0UfyedLoi
	 //8CU0rV6ePqxkvIkgujmbJKy+usyJb/MkS5xfeOGZ2JrKdKckz+RVIxgRAqaJgcMyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TeOdNADF8PbWanyh3zeJ8VVtqapoi4A83pKR8WNo47M=;
	b=KQcYborwyPtywRBf5AS/RaoBac1f2oBCKeoV35qZwex+E1XhBiGEezTOeU2mWzndUVHO
	 lkQqsjgr+je+n7a+vZK+gROSe0K/nnb8b9kWhLxspmSa7r77jFu9n+MkLJp2MOOwYxi5f
	 V5lzmZ90WrDYPVBzdvG5CfTZdxONJQ9G8e7j4HgGtz/v4AxsHiAdSyCbwATw1SAzIhbJt
	 oTiGEh2RhyY5JPN8gwqNt47bfeAeJ+ytDRjMUvzSjEvz7O0SPTdFR9dCvNNlajYPo1B59
	 mj4GwxiPxtaX40TkqZEEIk2hArbbIccbiDJeZcWjoZj+3gXhp4m7DfssJr6/lIcUW5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B5lOCSAL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EUdX6/C2";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D721D606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D721D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B5lOCSAL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EUdX6/C2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9BVWHE3368351
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 12:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TeOdNADF8PbWanyh3zeJ8VVt
	qapoi4A83pKR8WNo47M=; b=B5lOCSAL9XED7EOwzb4VP/rR8c5y0c84FDAN1u0f
	qk5AdWusuRIEf33+PYlELJrIJuy7HCz1ZwxVIorihS2bNZ2pE7YX3L7GhhwNpKRL
	Qkb2o5C9JfDntueUG78WSDFtHPg3OEDe1CBlJ4ZLSgVYIJcOaDVRpFi8Y7H0h4kO
	jcxoCBsR8cHUZlTcQTHOtJufPVQ9wKTDfMG65dZ7V2gTZCW1Y9N2SRAMlQFUV4iL
	JiWTHAKpg620K7Eg38p8B7K45pZT2tt9WGR/1Qgl02CEUTR78EjhbtuP7/TpNYup
	Gz6h2rsMmi4JIO8q7QgH6kwYrfbPLhqVcDcyMrNA3Wqh4Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj87v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:47:49 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2df72e621so129982137.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228468; x=1794833268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TeOdNADF8PbWanyh3zeJ8VVtqapoi4A83pKR8WNo47M=;
        b=EUdX6/C2waqexumt93zXVr8u2q/mqRyBKML2yyDMKNlz5bZi8UMWdRmlWLT+PAACMw
         Jyel0GlcLXPYZooNWZ4imwfEaqI72I1/S0ym3X/fNK6PMwkvlMStHSOvRb49Y3rctgPI
         +t7ec58NuIsjEup0FT/NRAmto/keqrWcI4qBqgnyoh1THb6noxjzUAy6iDOvWN6AmP4I
         MVml1/AtowWTEcrVGf2sfqBP8UFjRxUwZ+ElhZDOYA9zRBOFNJP8LetV0s2lpAXFmyAE
         SDbW55zurnSq1C9j+omrC3dKwRbbeHtMCfMw4qROc2fZla+HFFWAA7mwhHvpPpRUnYca
         Nd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228468; x=1794833268;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeOdNADF8PbWanyh3zeJ8VVtqapoi4A83pKR8WNo47M=;
        b=dQ6dJ/vORXM+BgWU8Dim8xPzbisHYqTQjBt0psLMgpj71PdPVWwl3jKji2H3tn7E6Q
         Trv1qRPR7NhTbEN9K42tcH7HNbJNzu6dDzw/msFQ2Q7ajSJ/DvK9U6cPqaJ4VQv2ADLv
         7iwjAuYEpN1RiynUwrvTERnYVX+5nGLM2o9o5RM/r9+znsSnXsK6Pqo/R0Twe0NVYe//
         e0RJZXjh3d9QtbTh37QtWXXAD/O9yk1X4LiyJOwVzEzkowqIRYRGg+OlzytQiYfM4A5x
         YrUwvFiaCWs2M4xJ+E39g67Sl+cDatMelS6Ms0qt5OCGVLcggISAotq+ypY25TvscHCf
         g1Qg==
X-Forwarded-Encrypted: i=1; AL+hErHJJFWfDq552OojV3QmALQKYHEnf5ux2KJtazrwwIR2S23SaFMRvjcJvZW/XANHBiOIjue5b15DaO6PJyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SCnZQI6agyYdx+aFEphR5P1Gisc1vok1O7QcU5HF1NRSRrjTP
	c4jf5iG6b+YuXOkkerjGEaub7w0z2eepXMwK1E7RaqcRDADCSQIuGMF0jj3m2Zp8DkEbJWXDRwy
	6GJO1OQYhxO4pLlt8lHErGQ5Lw7oF/aO897ybgieM342riy6/LKYYAs0y50B+DgTum6Y=
X-Gm-Gg: AYBFou1fRdJiV7TSbizmxyW/4eR3lXJoxw06kXF+O6rUlujTSrEx3TOcaZfenPv2heg
	TyiMa/4/xlaQHzfq9IkIWIQ44Ghlk2SfM+3yhONn6cV1j8KeiqGOnPhr7R1bQo2sqrm/WVgNio5
	B40Bu1b2291p/29zxCCQIIyqZK8kGgrZkfujca1vx4Apxy/wlnPEcV4+DJm7xnpjqrFMcTTYCod
	IgVNzU+XpjyFsL4ETftf76AW9hVwRWNBmC7oQZ1NuS4ohkWBIVnOdGQXzo873t+hZaBj4ocxk9R
	kQsZyjEsyRmXUBfHiqhvqFOLAuMHXPlt7czlfvy+6OJDskcNfgWJdS0sufPGbjb+r+R3IBiVq8p
	UEzUkegeatOu111Sf1YI5WLhYZEQL4yTeVmwidw0SZiKcMJsqcHV5HI4MB1g3/5M=
X-Received: by 2002:a05:6102:915:b0:7cc:56a:58da with SMTP id ada2fe7eead31-7d2db0dd505mr782553137.23.1794228467868;
        Mon, 09 Nov 2026 04:47:47 -0800 (PST)
X-Received: by 2002:a05:6102:915:b0:7cc:56a:58da with SMTP id ada2fe7eead31-7d2db0dd505mr782530137.23.1794228467118;
        Mon, 09 Nov 2026 04:47:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb0b0c2sm207416945e9.8.2026.11.09.04.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:47:46 -0800 (PST)
Date: Mon, 9 Nov 2026 14:47:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: sdm845-google-crosshatch: Add
 display panel
Message-ID: <nt2zeflxqbnxxb5v7p3ncaigrwlzatspcx72be3253bsq2t24w@q6s7wvdb3k7w>
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-10-87dd4ec4f7cc@ixit.cz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-crosshatch-panel-v3-10-87dd4ec4f7cc@ixit.cz>
X-Proofpoint-GUID: GOxPlaGyAl01mFt_cLJupj6BvAUrKo_k
X-Proofpoint-ORIG-GUID: GOxPlaGyAl01mFt_cLJupj6BvAUrKo_k
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1c0f5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=v1rLgdUz5MECU32CcTsA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX0RTj24lCJbOR
 0mbuUTAa1EdKesnKnHxS4sKxEu/5ehqYPTcqiyx81JFRJHudFEPrm5PVPG4yyuaU2AP1esRAB7I
 rG+IXIaTXilyWxmfyc8SMUkz6mwCbUY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX5nvg8t5NywpZ
 OfCFoWu7DiyA6OVBk4dAU3Ujk53oZt/bkh7YVcOqN/XjvqqeYoHbdUeMyAfH3wbNsfjbwfoUS9T
 V9f/wdZlYCUnEmSj5pc8KWMOGkyctUe+E64vAYxbARBgV1J7tKEudCrsqVuY3gZXMQ3WVKkyGaM
 x9yCS4xHL6O8BhNu19s7183wvUFubc0kaDYwTCcIgozuJXE4L0NUxY714xz052olBhaQGgDco45
 QgheGvhlDNXydL//SXag4mmvqbUxvZu5cmzFcCAkMKUVpbW7/rtN4EfNAXFMB9fOrKKcoBFfNwh
 thAr2X0M1ndz41inKudeLGvGnlz7om0EtPyrnvxpeROka71rRT80HlE9SCkBeqmECdfQezdYf/b
 i/BURLR9kB7L+3Ddm/cbh/XtALYUnqI0hvBHUnhsKuDWg8WKh09RDcQY/pVAQKDXN5df6HRUaQY
 sEpcjpA+raRfytRfcaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090050

On 26-11-08 12:32:31, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Wire up the Samsung AMB630QY01 AMOLED panel on the Pixel 3 XL and drop
> the MDSS/DISPCC disables that kept simple-framebuffer alive.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
