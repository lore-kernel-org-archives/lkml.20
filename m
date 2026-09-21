Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B018748423C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001216; cv=pass; b=mVBac1hBY9hDn7wjNXHhORdkTxpPrzx9EZuepmGA/sKdOj9H4INlAwrOVVt1G5+8VGzQzAIO8qquB06a83H9qh4SmwGaAAEwNGe23x/3pzY1h0vHynbxeCCru9fuBM0toiZTCf2IX6ZJ4dgqM5CSNTXeZPlES8isNDT/5RvKxLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001216; c=relaxed/simple;
	bh=DOLUHzyNbgypNt2Cb2gBz6juJ39hx7bJkNuPsJ+uwUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGAFDNlKy5bS5BOfSyjIS+CIlgPD+5nS6wN8N9KKJXcqnw4fJXTz+w9r5R9JWV2cOV/ucNV1AqJP5mAUVSPynDVf7q0/Tm4NGcsOoa7qWNblkInhocPzzLKGGsNfxRFWOk7aj00OkjNacpW0hgQQzuuKaKFra0UV/6vLq2yJYwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fz87+HYF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQDJX3Zz; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fz87+HYF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQDJX3Zz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGY4G894540
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RN49HaPQGdrm1yb0dZkAMriqXQ6TCvsapV0/mYAPYOs=; b=Fz87+HYFeYV12a3m
	f+pMsxZZO/xAP7mGdkNmLg9WRgreu4SKgYlWEUyW1olZMk8HDHvixkPBy69Goewc
	SmTzNAm+yCwwXhxaFAD2ihOBXHTNFtfyPLpQMaRCbeOaAlRRusH1X5Nf9rf1RwXI
	Bl+YwLDLPPtw1e6wUWkCMPID4zX/jmT+bbKcVEAq6ktXjwOZHvCQ1hasqgUJy3bH
	EFAhd6vc/qo8ryuk++Iu8sJKR7wKR29WCcjsDK6QdqSC/Tmg/bsz2WRRQlzT/fUW
	JiqJLh7BqkVtrCIVES12YpVeTq+M+PFwGN//muv/Kcn2gBRMOEWbWZxvQ+/Y1A7a
	B7tCgg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxq9rwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:33:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b8088203so2662802a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:33:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790001214; cv=none;
        d=google.com; s=arc-20260327;
        b=DtM4MZdLk+6aqRI6caWFvBOipSfLqPzajbN6JaBYd3N1+1kCvaePv7SZw3yFugrwb6
         meWksm0+1isEMi0aYS6LLSD2lqaKcPI+bezxxCMjtHbia5alRQr40zs+t+Bmew9tGD/q
         rDi5RukUOg/bAeENeUrgsBrEpSUS1JsQpFpNOrwO0NUUNMbc6Q7gdfHJFWxcZ7sU2LJu
         I7Zp/y5Ga4c2NlNYTtpDm5bGSuRHJEXC6L1xK74cwkBmcvhPZaFYYqQ8UHdqltvE0XAy
         V4Infw9l5aQ8yAEYDpc8Np1BaIpfyeInhUt4m8Hnp+R5gxXfipdqzIsf9Z1LqXYKGhpY
         GDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RN49HaPQGdrm1yb0dZkAMriqXQ6TCvsapV0/mYAPYOs=;
        fh=YwYy56sYmC9F/RoQgO2x9WDjimm4XOsq7GNNlkQvAxs=;
        b=PL1jfoURBzPfTpi238BufYk19z0uVH/W9WWBMbM6WsOFLiXk36SG1jLr53poRhV5by
         Nattp6VoVNQzfERSfGSEebtR70lq9Ghu4MRKq5pgs856WsMQzKvbPo4Wu86SkDMQMfiY
         g6mrluFQ7Tpw4P48dDm+NZtMBucly/zv8lrdVXAo4OjVcmB+ot/51R8zLzou+r+UtoDt
         ErdaImf5WI39XZtuIhwJ9bm0aC4eqkwFuyPl6w33z5SSxwd60QSScmS2I2kHJkcN9vGh
         JJCp5KjU12zxuAfVyL9P63+uAuZRE5hju+zYH6Ga/Wd+QAZ+SlPg9YhENfEIBvkc+JAR
         HcoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790001214; x=1790606014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RN49HaPQGdrm1yb0dZkAMriqXQ6TCvsapV0/mYAPYOs=;
        b=MQDJX3Zz412DN6SA4vlD3OMTRXSoKpf+UQaACchxKl9nZKMCqV24AvBiEbkr6NAXYz
         2Z1L9I0DR6D2FEGAt4toK4AVURVj9n6yEMpZnUaUeTcMTTAm90iZyQvrFcIiHbLFtHQR
         vpoIjnIA25PWb31+b+On36rAmcXWl6wtvS5S59ZMKb4hPCDjPS6/yQFelTejW/mAF8US
         sozu6Kb+EZ79DKk3N5iEmv+I51Nk34doUvgFue5w9oMLwdYVXt3FJ3/pF1XI4ljWMvfj
         mh/1dato9bVjJtdLpTOgy3prN/OQj4CRY5Hqb7ql8G7cY3hFURaYpxY7r4waG7/RyAV8
         AouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001214; x=1790606014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RN49HaPQGdrm1yb0dZkAMriqXQ6TCvsapV0/mYAPYOs=;
        b=ZAShMcNCNM7451S6KE3xTqd+yuuD6sKvPPBjwjn/HFupTOmd5nvj7sZ7+KT6zkp0JW
         cMeFmzCalcec9IwtiBb/aYaWtM0/D4Nt4jvBHRKM/ZHLcq/49PnQPsSy0nSlYQpdooms
         0ui26wbX3vEKvaPkf8cLLR0bwhKQlUTJVobFirjZhv/Cbl44We8pzdvXBY9imblZi4sl
         H9SQNVjMwj3HBjLVNWbdsTCkMT6b2xRiZr47mjHlF9ufJj9wt5ITvtvDum+Ez69uzMwm
         23l7YffPjlVRILt1oGw2KPCX36eyCoC/5U3vTGBvkcdTtBmmieCFTdYNh11+ZCx2qAQ0
         B2Bw==
X-Forwarded-Encrypted: i=1; AKwUvBz58x8V+iu0foZm+AFK+iN1bViS0IOkDGt8ws7dT1iGLzUidfoZ/qNL41mc5X6QTO5lSDcDPrWxi7I3iH8=@vger.kernel.org
X-Gm-Message-State: AFuF++lsrow0fzxMh1D7hXOdNsPWvmVzXisHqICvXzWHqVri7wu0wpxa
	CBhdQGKhlkT/tgbAO7JYXjXOtrbsnMQ+pRyrqqLq/CbM/9K7plGbMWpZFrghnNwgZ19CB6qWOH6
	8nHPCXs57kKyVlwp5WH30v/KYjKYs4LX+BU9re/28Ot/sPGUyZN4fPr3/7UJsJ76jNsEoAXKzU7
	uJP4g8NPS4eim4877xvxde0Hc3t/CDnP3xGfnv8WbVFQ==
X-Gm-Gg: AYBFou3jjOATgdp/zJ9slDem7+y4P0KHgwAansvGnwMsO+kP/I1UeKwUyUO5j1c2hSv
	W2wRDd++/38r0D7iQYtzbOMCIN+uhiKpiwv+2KN2w4cXl1ubWBInzLOpc0zpAw56Oe163dLt4iQ
	gM5OBJW7bu7n4OF3e5uurLgaorH0gUk5JGztEvmTS52+YEa+4sUPqaDXwZdA==
X-Received: by 2002:a05:6a20:6f91:b0:3dd:659e:5db2 with SMTP id adf61e73a8af0-3dd8c4413a7mr18266805637.16.1790001214388;
        Mon, 21 Sep 2026 07:33:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f91:b0:3dd:659e:5db2 with SMTP id
 adf61e73a8af0-3dd8c4413a7mr18266769637.16.1790001213920; Mon, 21 Sep 2026
 07:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <86da16a61c58eb08419f7528237c124e519f0a72.1788791506.git.geert+renesas@glider.be>
In-Reply-To: <86da16a61c58eb08419f7528237c124e519f0a72.1788791506.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:33:22 +0200
X-Gm-Features: AcwNN1Wd_6jxzpMXptAMEPqNJszFTSpjB9lLwhY1vA5MxxJu1fMZtdoj5lA9YJg
Message-ID: <CAPx+jO8y2Yk1KwAey2nRsjjduGbvfy=rHqsToDHhvf9sfMMNag@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: renesas: r8a78000: Fix lockdep false positive
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: fZmvjvfN6QgIwWDdD4OUd2lTgz4jTujG
X-Proofpoint-ORIG-GUID: fZmvjvfN6QgIwWDdD4OUd2lTgz4jTujG
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab1403f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ZwIrdqM33KZ6HQH4p9wA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfXykeFSPVAZQao
 1nvZFY7mi10jPRXa00FcLJa3J31m4GJohgGddb20VuhY3/uFKEMFlFEjuQ8BrTvM5Bvi8OoFr1I
 GQeJRgXqjvurvMTVqdHVk9WPo+igbi1Kfp/za5QVz4Bd70AKnVCO9c7ftnr1ZYnAEmGT9uKcIZu
 wpzFjgZRPSSR4naLKrdyiNp4X+jqK9WNGVYQp+biQp/tJ2CKjjIcgXPv4O+RvbZL9fZE2qszlW1
 84oC8Qxhtj99i6AuYjH2w2r3BySakktmrBcs5sPVYCZCN9ZFWwjxhBsZ1wRP5RZraLbFbVx2qb9
 L6yQx9nvPOGtnvhWJQzRy7Bbxl7VNd1m8MfkDhPb1+Z2JDwIyN5Z1RD4VXec8GD8Kgrm+xpLSAe
 QTprgp247MAzNucHYIwfHLQIMnNR9ExI1RUEt24mQtLspkk7+S+WqIqqcVE0FFZ1r5YR6+kQizZ
 mA8Bgrzs+VG5MbtAZyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfXzmXfBTpe5bW7
 +f8GR52P0mL7hbiyWowHuOcJLvmefpRU0qI2mamG1NTAJiG8b9vHsYtplS1OKI4BpK8UeggMEJq
 mRYaGrjYc/rwoko8Y/HYeNa4m5TPJvM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210211

On Mon, Sep 7, 2026 at 4:32=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Lockdep reports a possible circular locking dependency when attaching
> devices to an MDLC PM domain:
>
>   - During creation of the singleton PM domain:
>       A. r8a78000_genpd_always_on_singleton() takes r8a78000_mdlc_lock,
>       B. pm_genpd_init() takes gpd_list_lock.
>
>   - During attachment of devices to PM domains:
>       A. pm_genpd_add_device() takes gpd_list_lock,
>       B. r8a78000_mdlc_attach_dev() takes r8a78000_mdlc_lock.
>
> As the former is done only once, before any devices are attached, such a
> AB-BA deadlock cannot really happen.  Fix this false positive by
> introducing a separate lock to protect the creation of the singleton
> domain.
>
> Fixes: 89e6a71b35703f10 ("pmdomain: renesas: Add R-Car X5H MDLC driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/renesas/r8a78000-mdlc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/=
renesas/r8a78000-mdlc.c
> index 2668fc2ac9cbd388..1fd71bb3da776eb1 100644
> --- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
> +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> @@ -45,8 +45,9 @@ struct r8a78000_mdlc_priv {
>  };
>
>  static struct generic_pm_domain *r8a78000_genpd_always_on;
> +
>  static HLIST_HEAD(r8a78000_mdlc_list);
> -static DEFINE_MUTEX(r8a78000_mdlc_lock);       /* protects the two above=
 */
> +static DEFINE_MUTEX(r8a78000_mdlc_lock);       /* protects the list abov=
e */
>
>  static struct generic_pm_domain *r8a78000_genpd_xlate(
>                         const struct of_phandle_args *spec, void *data)
> @@ -191,10 +192,11 @@ static void r8a78000_genpd_del_provider(void *data)
>
>  static int r8a78000_genpd_always_on_singleton(struct device *dev)
>  {
> +       static DEFINE_MUTEX(singleton_lock);
>         struct generic_pm_domain *genpd;
>         int ret;
>
> -       guard(mutex)(&r8a78000_mdlc_lock);
> +       guard(mutex)(&singleton_lock);
>
>         if (r8a78000_genpd_always_on)
>                 return 0;
> --
> 2.43.0
>
