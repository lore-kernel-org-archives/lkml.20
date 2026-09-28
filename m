Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A740546D572
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582140; cv=pass; b=Bc1JUClhNF3eszI/dUGWF6kwcpC+3DBdKhBGwOJiUdyESdO2pNoLhICUckBgM6UCpk8UdtVIfrxSRb3A2tiiZwgu2NuV0mo0vwnh2ZgRyDnBkoTcXNY/D5euInk9WfB4aRHr0Tu33TUPBMCC9cOUle9lLrZFDgzQsSDBhT3Obu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582140; c=relaxed/simple;
	bh=UuW35MBetpwb1g3X+//n/9JYo+liVtpSrqvfGQ3Z07I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Akra85KwtpKk4Ke5tXP/di4ckuBCF3KFWJo4sKfXPnpgnIKVXRKtsPl2CEFdRRykPIHWfLQNMLm/mZbfuVhZ0pBSZhFfDwBGcMKziBIq96hxDVT9DjVSwwnqQui/oM+RgCriKHEj5S6xehBe+Bko269iHGbiECp5bcxiX0V1KG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0peEhYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/uhY1fd; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0peEhYk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/uhY1fd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S6EWO64026549
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TTNiXfyvPaAwMHsslS5POvu5n35IM7ktoXHv5WJO9sE=; b=G0peEhYk0QmYK2Ue
	5puv6C7j3KK7DGvW/TydgqUiMt0lZ8pg3e8dmIyTZnv0YiVCBcV0t40EqChxrXyL
	O7l7uMrtS3whu7raqcVGxBKiqmGI6qsAyAh59nwLifAiLirSoNE/hQzv3zhFIIdO
	Du+vXbgcXKTBSmaFjM3yMAi6JzbWQGnpffOhRTLYJ1lWBMSPsgXR2oMJWoZRDBeA
	R6DyChEL141+gwRtR4T+r6TP4oKbU59UkK1X1j+C6XUU0N1VA0GY6IeE0q4TIbVQ
	KphuqqOHkBrgWEkMtcci/UMnxMG9PDpDQ68ieiGxs7TxfM7emOo3wOPSym4xRM3w
	FSKvLg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt10b28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:55:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a05d645acso596399685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790582136; cv=none;
        d=google.com; s=arc-20260327;
        b=ow8GcjBavmSe0qBXy8hJc4D/iDCp2shI9v4tfjbXM9EdYmBqctm9TIJ9JNNlTvjXK9
         SK20ceWGbh/cLDFqdcSOePO2FfroEk0XR6Xx4QAui1/Uzdyyk4ijk+YcDBIbSaOfL6qU
         eAlTX3vx3dAbjNG5OVvCgctALIzHVEmRal/IIcfyonxY7OFv3gPN7HMdwVnFqhszmCQN
         JDPBbOF1AW0BkDDgUXjRHCe1HMHTCvwhfihq+B6RHbX70OWOfxGp/bXN1Uvh3j9rdOdp
         xzFeccK8sl0PkMHYGauUEuJ8oZP7BGjpioyB3e1PL+zsuamqcZQGTPGBJWRZN1ftzhLD
         frsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TTNiXfyvPaAwMHsslS5POvu5n35IM7ktoXHv5WJO9sE=;
        fh=mhreaConTACFPyz1WKYF5e+MsEuW9m79bbp9QcZlyxE=;
        b=FmbG/8Ef9XjnBQCFwixn4pqeLuwBRjKPMQY39kZWJZ4sSO9fi0Z6sR1WG8ZF/1GAlI
         EhoHI1SPNYtZJ3bjt4bR/PIrRrFv2DevShzgZ7Y2LZr9hJxDcEh4QX5KmxMUijQL3Z8Y
         nTgES43L7lsyUAkVblOQ0V1QweCByzFhG3zU5zUpwH2T1S6DT9vJ4+Rm2itn/AJX9laM
         Owt/pgnkYU9QHbveu31CaWi/gq/0QWnHARVtfwjmYP5F5Fj9m/3D7ccKr1/hszPMdmwK
         IuXHnLFli4jEeSPg0eWzGJgr2a6KIWXtP24iUf3D6gDUBXq9CbflOgNN+8SC0jgB4qUq
         EiVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790582136; x=1791186936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TTNiXfyvPaAwMHsslS5POvu5n35IM7ktoXHv5WJO9sE=;
        b=b/uhY1fd2nKnFVrwPMWldzMmENf82vQ1t0Leufi1lAL1tkEdvzSCTZHC9I16t3tpcZ
         zvQapNevGBsH4QmgQCANizqPYKAQR8JCCgRJlV1KuucH/rckznjanAPblHA62+CMcZnw
         kx+L+VXUoVfXEpp6skYh27bVVHTTxa0nbI53ZVl3Fa3ZLlzLraPggDKlMs/zV1NRuqoS
         LL+64QCu40BBvPw9xxvEjWnwD5OdAfp5M6TaJq20OnpWWPRWF5oBLGjw1+e4xtLwa9LU
         ImGmVNYIodM3i/5X2YpwABneW9McfHT1GSE3Hj7aNjA1NU3ftrxdgyK/ch/2MtYshKPH
         TUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582136; x=1791186936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTNiXfyvPaAwMHsslS5POvu5n35IM7ktoXHv5WJO9sE=;
        b=aIVM7Ms5sFUy2oYkibZtbd/9SSHf8ickeZUFg3VtE3C+RVZ9L12M9V5ogd7IcRgVQp
         pVB/cOHtwAL2u7Lafzhfm03tJ0EX1rdo+PXzukux+8p+NpOaP5k6dYFJwyNGa4Hqd6WC
         73Zq53WiUXX40084Qbhg+/914l8E0CZYmSnCn5gzT4UztAq25uu2fAXWE4ZaI22byGLN
         0K3egqUhjJPnrCsF+canDAKBsm2CEjGJMRhpSNdZxYI9pyXfcPCtkE2BAVhvrhzTqOEX
         5S6L+BpyB0GtT1Gb6OmKQSenKPJYbyFioJI9Vcfs65QkuRGbWlwGiYDcBDPQq3J8XQli
         uFHw==
X-Forwarded-Encrypted: i=1; AKwUvBxV18IcwLM0wLvxSDd07cLmp2sB2xTrR2qlMDBlDqjXBbjkj6idwloghJpxkSf7pYyeIcAh0sv5GgyzqaU=@vger.kernel.org
X-Gm-Message-State: AFuF++kP7YosaexhegwLAnePFnlbECg42/xrzwi8sd8l+ZkTQIMDKZSX
	QDUu+YofCPWo8H/mgJSfoGHQoNE6cFny122rvOGRD3tVU59OzQQIvteo/PT7F83CkYSgpPb+C/E
	97f+7BGKYUbLoihqLUVCXK6qD4TwnD4an6QRE5J8GBcjl4OtVQupb1pOm4BCd+tko3v8IBHq732
	nN+liDaFZtoa//cpg19vTUBPI736hF613mY95s9cCxmppuj/VOVloG1eY=
X-Gm-Gg: AYBFou16O4RPBXdMVjJFlZrcvBE9x/3v2pliG1s4SWk8w152oK3mhmgEDU1vwT8UHJ8
	3n3Bc3J9JZzjtV7azAm+f/z5eipOtf2xOI3Ii6IgBTB22yXuuqHQRkeoN9Rkov0q7i722ktuuTI
	6KoTVWa72IVmpsuhB9K4AiVAX32ZUQcCLqXTfiNTsVMNYnDUJJoV35AxFmWnkpk/JTSrSS4gTkH
	ctiPaqdTPO+PS5M9mhlPHLD5jlnSHAM3X9F0cbQHX32TwL44xmMg1z6SWIijtA2M2uJ5HNRoGc=
X-Received: by 2002:a05:620a:8810:b0:939:c303:c54a with SMTP id af79cd13be357-93c43c9db58mr1958676285a.31.1790582135654;
        Mon, 28 Sep 2026 00:55:35 -0700 (PDT)
X-Received: by 2002:a05:620a:8810:b0:939:c303:c54a with SMTP id
 af79cd13be357-93c43c9db58mr1958674285a.31.1790582135196; Mon, 28 Sep 2026
 00:55:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928064336.272659-1-hitesh@ebytelogic.com> <20260928064336.272659-4-hitesh@ebytelogic.com>
In-Reply-To: <20260928064336.272659-4-hitesh@ebytelogic.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 09:55:24 +0200
X-Gm-Features: AclHuK_oGCJSjSnsJjbXR3zmNY9Fqnx0g8gO4MkrHkFwsN1N6iEzDouVu-By03U
Message-ID: <CAFEp6-0F-0E2OAQXVbW5fk5bPyBJH-sxWax2vDUouCCe6RQzeg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: qcom: camss: vfe: Fix VFE reset while
 another line is streaming
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX4R6hcpKSg2CN
 2AThG00JasY0bizpMfz4mljlraxTUiWanRRsEBMkykFLbz9B+CHXVqqF4oIVNHYCIARwu3cGcve
 O7bPxTrxOx4OUCWJmBdlKutepgplgAggXgraElrBcDm8I0qoXSy6wFco+FGs98ZoOElp+IxjNgU
 Y/xOEagptrDmT7fr1b9OCsABxcbBxUPt6Ekxsfb4UzdXI9shURDn7c6ZXucaTKan9M48GhU2wWX
 OAnmNmodgfXSo6dztxnvvNZ1F//+9yY1V3g1KMpT29c8yLm6WGmcSh4NnnEfC+8k1X7427fGdrt
 U+E+wpZ5pkD7AMrPgme+QeOv2lPHsIZZ33jB4sqeaogbaSS9rz5SulCkB4V97fTGLZZpVOgkV2K
 6qlPBbzlT/Zo9xTqCJIP9BrqfPQzjxUX7DeqLcZoVhisp+E/+Cva4hwz3DZf2K3WPC3QyyBOnQa
 xNSf5rKMQWusyspE8HA==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba1d78 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=ZovgdgjKAAAA:8 a=lF_edr8HrfaS-bhVEKgA:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-ORIG-GUID: _aMAeCgId5rdPV0r3Z_Q_E_LlQ7OYNy0
X-Proofpoint-GUID: _aMAeCgId5rdPV0r3Z_Q_E_LlQ7OYNy0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX7lcQ7SuJYpgF
 bumEg0Ce1XO5B+6mF/WfAYgZnt8uZqX6PhR8kjM6k5Uale9nFg+cJ2wThNEBgC/SvtR3oToJET7
 B4NMBo0VjkISHnvcoeUC4E+y+RMLjx4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280031

On Mon, Sep 28, 2026 at 8:43=E2=80=AFAM Hitesh Patel <hitesh@ebytelogic.com=
> wrote:
>
> vfe_disable_output() stops the write masters of the line being
> disabled and then resets the whole VFE. The reset is not limited to
> that line.
>
> When two lines of one VFE stream at the same time, which is the case
> whenever a CSID demultiplexes several virtual channels to different
> RDIs, stopping the first line resets the VFE underneath the second
> line. The second line's write master configuration is wiped, the
> buffers it had in flight are never completed, and the VFE is left in
> a state in which the next global reset is not acknowledged. Stopping
> or restarting the second line then fails with:
>
>   VFE reset timeout
>
> Only reset the VFE when the line being disabled is the last one
> streaming, which vfe->stream_count already tracks. Stopping the
> line's write masters is enough to quiesce that line on its own. With
> a single line streaming, the reset happens exactly as before.
>
> Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version =
Titan 170")
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index c14d97a131..3442dacc80 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -814,6 +814,7 @@ static int vfe_disable_output(struct vfe_line *line)
>         struct vfe_output *output =3D &line->output;
>         unsigned long flags;
>         unsigned int i;
> +       bool last;
>
>         spin_lock_irqsave(&vfe->output_lock, flags);
>         for (i =3D 0; i < output->wm_num; i++)
> @@ -821,6 +822,13 @@ static int vfe_disable_output(struct vfe_line *line)
>         output->gen2.active_num =3D 0;
>         spin_unlock_irqrestore(&vfe->output_lock, flags);
>
> +       mutex_lock(&vfe->stream_lock);
> +       last =3D vfe->stream_count =3D=3D 1;
> +       mutex_unlock(&vfe->stream_lock);
> +
> +       if (!last)
> +               return 0;

Instead I would move the vfe_reset() into vfe_disable().

> +
>         return vfe_reset(vfe);
>  }
>
> --
> 2.43.0
>
