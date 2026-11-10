Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794350085;
	b=UxPkV5/hyVf6g1ubaHmXue0D5ooD5PFr5iagKUZtRtd83DgA83sxZpFGb3oLa+0Vm11Y
	 w/h/ww9iaB4NumRiuncl3vNcYXFUBTiwPVfy6LTbPeewf/NR/l39JcBBCKIzerjYaxU7e
	 H3UHl89tPTiPef9Xa9iD1C5778eBrtFexEIysyWhpgaoLxqk0dulnm4BmPmYoLzUT1s11
	 EbrKkK7MKaAGsZpYmPupjK7De9GEzjndeELDki2/rQUncoZ1decVwL+lxC1olIzNkni+0
	 5HMB5j4224QwsorvmMQPRVhfyREPc5h86QCeLKbYiKlWxGmKHuTxPHpI090O4Imk69g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794350085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IvL1zYmWG1e38nSpp9eLWnXl9WrfBht/vX1XlfPoCws=;
	b=Ege2/d4EsgUcouCQ0cXnTXB7AjxOS4xBamfcULMIOSnBn8jRouH1lO6I7blQXjxD6Fir
	 6LXCd8/GjLSHXE6WNB+QAqKNy04cZHL+Fizbk/u/bjgy6AuJDYF2vXwGdnN23k75sXLMt
	 n88Kz4AQ+OfpFGmfmOIxruTEQSZf4pOLm4KV/ygSlJWuPgUxVn1s13xbUYWbTmKlJ7u4q
	 YsoLynqghliEdUkPwSOF6w6mBMgFxmet9MkCiXDQ4JFIbzWpirhHjqAigYdM+Ma0Y2rH0
	 AJfZ/lg8bdZ9pSJeEKcLoGayB3TH2KcMfBn/2xH6mX/7PtiKctjcPZ1CUBavfowUpAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAZ4n8Nf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPAF4IC5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB169606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB169606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAZ4n8Nf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPAF4IC5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKfsd3061008
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvL1zYmWG1e38nSpp9eLWnXl9WrfBht/vX1XlfPoCws=; b=DAZ4n8NfveJRN+DB
	Z6DoHMAXwsKCwN+7FUx7rhjwPSFRNim82pOhUdcoLn7/CnwHW/ITl3U7Ee8i/Mwk
	e9wk7mWcjGShg0lOfnvU35X0c9Vl9imrcTkmwZ8BHmLXK2Zdkmzn0rNnnUMn5fGB
	l8QV59zgmOgU9IQbJsTfTBvIDdCO1aUWxUuVpeXY5vIIooYlKxJXrUuMIjRzeO4e
	YVG/XR0BEo2w8/AdnVdHznhEBbdv1JNdXjNxjEOOV8rRzuRV7VPgPPFK85ddBF+R
	byTC/t4ZBoxSqgf0drJaTfjdtqprj+qaJEYs2XrCVJFxcJuiJ04rFBmljglIHI0t
	biJ5Dw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b30pn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:34:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so4115390eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794350083; x=1794954883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IvL1zYmWG1e38nSpp9eLWnXl9WrfBht/vX1XlfPoCws=;
        b=PPAF4IC5WFWPoax6gEDSaw0qDTp7ldi6HPYFAwsFYt6mmwiSqIs8jLELd7dYLgIxpY
         FC38XwYmIHVjR95UQJ4zDpbBYRthtA/sDQ9CMfpNeFUQ6qt28mejuxfZTIEGUD2DaMEw
         JlE83AeDFGZZFLXXbV8xzJPNC7XtWa/kN3UR5e3LmTImyL6Q2+fUTc2RqL3jDdScREpj
         i3BBw4cIs5BcTmMnr+9w7lkRND7pjjLjpONDz6RVIEcWo+sI7yN8Es1JxMTkSA8dfKZE
         p5H/kfmiBh5R+CWl2Ora1kjIz0uJMfEQvASSrp+AMZQX0OqyEvVXhz2LrSkLcddzobul
         AKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794350083; x=1794954883;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvL1zYmWG1e38nSpp9eLWnXl9WrfBht/vX1XlfPoCws=;
        b=h4igndwducEjFoFCoPT3k8/aYyV7NPSWb6o59wTvsSE+M1MM/cli2swUTuD5OFro5C
         GCcLpGs/MPXjugMqjEGwjkb7i1qfbiEKi++CYCsQuewG2nYzERxBnDozQNsD+1Utu0Ov
         2UEEtvaUrArhXvr661936yK+SY38efYiVkDfPGpMIiFUEvakOBE6aF1SgTsIyRamsfrj
         cX0OeiVrceIOJtx/WRUpwi1S/l5cO0vhF/1WE7nYaF+Tlt6jxNvLbmYujX9PnJ2M/JgG
         BqXy9UNta6u85vuBDFe5L9OLVjOHEgaZadE+ZVpFeBPHq4oEGAfYdHN7A++Ozp1qkl7u
         Hkcg==
X-Gm-Message-State: APuU4Z83ZnpPu6pojNoQ35aPNKdxK9Tb0+UQEFym3NAQAedZmiCpiCLU
	BNQuhOoTUdlBOJ/fOnG0tk2cjvQAL/syudYB7YkHNWNNRwy6IwQGMF/X/w2mxBfSDndIxDxoWfn
	Rm9xgsV7fJMJpDYv++J1BVZ4owjzcoKsFjFtPukLJOo3DyT0SUfOMr74VA+EnnpJqljE=
X-Gm-Gg: AYBFou03H9n7Eu1IkAGSzrYZoexyKOEKmlFlS2WlYbFzsPVgbgpA/b0+jJL3+ZRgkH5
	6sF+OEGe7Qsg4QVuT7Y4h81yRXdj8dPDYUoivdkz4AhhkdqnWy4TniO+n+D71sseNNb90PkHzoI
	STKh69CLicGbakC4UxnwNzjWjhZEAsULQeCCps7GX5rAUAitbWK6xgmKChx+ej/zSXG0Cv2zASy
	yPnFjyNIBxcPJqV9FcMJRKyDWrKtt5NlLOE6IRv9/45HC1RuRZ8jHpYD1w4irRmZOj2W/vKPite
	rYF3btpgcxJITWRynhSu1nC8QcHMLXe6M8/x/wr2JzDxxKRgL/nttyjKUBUk/N+MBxOwKztNwaX
	ex19tRsx9sDY10jj1FxVDfD0HllHbhN/0A/HYOtcDAHu4Ca98Y56IRLphDjowb6uSfL9/vhHTN4
	fcHc3068jjklJ5EXSyCZvWnv0dEBs=
X-Received: by 2002:a05:7300:509:b0:376:2e3d:7c62 with SMTP id 5a478bee46e88-376854b98afmr1391395eec.12.1794350083190;
        Tue, 10 Nov 2026 14:34:43 -0800 (PST)
X-Received: by 2002:a05:7300:509:b0:376:2e3d:7c62 with SMTP id 5a478bee46e88-376854b98afmr1391305eec.12.1794350082385;
        Tue, 10 Nov 2026 14:34:42 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm10389393eec.27.2026.11.10.14.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:34:42 -0800 (PST)
Date: Tue, 10 Nov 2026 14:33:56 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 22/35] firmware: arm-scmi: Add Telemetry generic
 event support
Message-ID: <20261110143356.0000451a@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-23-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-23-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af39c04 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=phf3XAa3S0evUxb1xUUA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4OSBTYWx0ZWRfXz801CLIP5nfp
 YEg6zDdhqZ7+LtYhD3KKYbdCLhpMXVNq6mo9GA/FriV+Ofg0kNxnj5sJJxzJ2QMdzOWVZdjjgyS
 PLnVW1n8mODAk6EP9bhGx8hxFtG2TEPDsfAOKiW56JyV5503EVnSuUuSHRPM3eu51Ry6K4heca4
 INyuirwqkXw4U5wcHKvomxCUICXOLmkcoQhrEoufDuy7585wVe9EoZe+lAq0MyEE4/a9oiKEv/j
 cSK+YDIhGA7+ttNjO4w1GcR86Ta41WgGhZuL7y1HP9vY4DG7YIoqtZ8iXZbmOl4Me6BVksdo1Av
 MCS6Zx+pO0ugrRrgL2PP7ETXoczaqJfvQeLvZy1h+ERS7M1ks/fOyXtrJGQuXXbjxNJA5D8s2Om
 Rh9Hd2nN/i7SlxnXlO/qtfIiYdvsiz4uAnN0b+lfsIL8/jwn0YcLOep8YO6U1WoNc3/8IWza61i
 zk75G7S+A2JcNAuunQA==
X-Proofpoint-GUID: Ihn2SFCEsUVlJf3mqhJq_LMtZZklabBh
X-Proofpoint-ORIG-GUID: Ihn2SFCEsUVlJf3mqhJq_LMtZZklabBh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4OSBTYWx0ZWRfX+HleiuvqZ4Vo
 Y2EWQw2mUermQJelwm9hRsHA3R7/5O60hkdHrL8rJkPrKezQNusSp8cYafPsUXL6qq6BBRB3KB1
 b12tjpzAgAJm8CVv6f8ZxD1lsctzNyE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100089

On Mon,  9 Nov 2026 09:12:08 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support to allow SCMI driver users to subscribe/unsubscribe to specific
> Telemetry  abstract (non protocol) events.

Bonus space before abstract.

> 
> This enables SCMI drivers to subscribe to available events by registering
> an eventfd context that the core SCMI stack will use as a signalling
> mechanisms. Still no real subscribable events introduced at this point.

Adding a fake event isn't that helpful. Just combine with the next patch.




