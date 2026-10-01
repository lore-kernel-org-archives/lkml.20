Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641D240B38D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856883; cv=pass; b=F1NssPEUDY5HFbETc05jQBTBjTRwGfdqISo7TOR/nfk5QgKcD94SdRIBUGrq/xaVKUScKg5cINE/B/ZkSxDmCju2Nc/R2uao7SI9NtKwAii/wKFGx2QarRGXQBNosr++p7Wjx9TS3yfxH/T4fsqxduBpSyZ/gEfVMkt7aa08OEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856883; c=relaxed/simple;
	bh=GQ+mO9FqZTwGcpM6upiyjFp46GJQt7lNaQI6Ua8Mn+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lkYN1xli8uXunOjL+dBglXkPlR/n2BpTgHD0CHsGhgWuhGFQqIPJp7AS7PZSDy/TLWac9vzbqtNPGSA9aCAQIc6BjON3tkmtVL+jSXMChnMfm7nqb9NdMl3XYaZo3daZT2AvTEFgI54nnGVjACi0i5av3zeYpxrRYd0LxXndzf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ix+QKi5q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dCtO4muj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ix+QKi5q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCtO4muj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691AkGg03388450
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 12:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y2V8uPC0AzCmkid0pU7KtPQteVbme3oQvQ9onokkXOY=; b=Ix+QKi5qPV1KtdYU
	Fd25b3ki3mnYwBCEfyyo8hdnic98d5QIh6iuvE6YaWGQ5wyjxfrRUAtvFXTy19dR
	rciV7KX7QI24gLaKN1mcP2EKic2w47fzakCeYc7x9r0OAjhiu0zuewMAp7rCOJfm
	PK2uj6B38BTmvItLU4ryTowSYZxZ0iaaMokEpxDNVywufMAGE0aXRWrUIBx0j3lU
	J9fs4CYlvJYIlrwm0y9UTz5vf0uvZPnMnYQxXS2pdmx2tFzw9WfuKT6wK+c5e+7O
	azYNBplUrf1peMWraTpwUdfDTrMB2j0fkv2CM4MsUiAdPa6hXZ6gU2IlgUXy0bMJ
	etfVfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1p2b8avr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:14:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so92603285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790856878; cv=none;
        d=google.com; s=arc-20260327;
        b=M0wLh5gJnX1nX6LGfLUyQCQ0M+HxF1q3j0dS4A9pYDok2hfNb+MMTW7hYdZMZyw3d4
         CEJmZi/1J5iNNKaBqs7VQIDw5q9QwZetyy0Ikks/w9sw95kg6SLuKQcjsEG3J1lyg2H7
         a4ZLP1Tyu05vMZ3lR0SIMPCf7vDM4eqN9GLZ1CN6gTltJRLuwBcjk8HhLFjyQ02h6Z/Z
         Vpp1O0OOLLNcUMcnLPp9+g21H9OaEP5zuSgHWLyS+RgADoDFI0zu+XOinzyh9KCkjfW7
         VJOBGCl7MN9EW0mmYwRjW6+ouItzseRsGtqzI0U1RgkFFxoMYadr0SaeDfHKiL21YLBG
         1ZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y2V8uPC0AzCmkid0pU7KtPQteVbme3oQvQ9onokkXOY=;
        fh=A1CDN4cP6Isr7QVmoCIE0ROAo/C+HB6TjKX6ICjI89g=;
        b=bAnohRh9BM3UnW13SQW9UgbgwZl2Y3rK9+ZyNfFuap7FSBaoEAYBi2Yim2saHHb55N
         vY0j+X8JciR8DgNSTNSGc0vpaPhysihhNgSN3mwG3SAgqtZMLjWsA3qksqCJquDEXPRU
         e1hP9/5X2U8dTV62J+wAD0ey6OLaWcCTkjzayZYHL1BUIRjkKFLt9sIEP33cTM5WjfBg
         ZnZQV+6nGn2gTKvqT/Z2QjbUA13fpodsa/JJcpMy36sUzoM8yqdVPybhlCvllIz1r6SV
         yhmNLjALvrwqium+osWnQSWX8yHl8quInC6v6n0yrALWerJDouJ+4GV+XUpEoG0/yhIm
         Y/zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790856878; x=1791461678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2V8uPC0AzCmkid0pU7KtPQteVbme3oQvQ9onokkXOY=;
        b=dCtO4mujndbEcqcughlEHpHAB9ClpP71TWr5+XYy5XAR4HoQpiTgeBIgmzyY33GS2w
         pPh4EM3v1HhBjVFA+GJmuQEnOZqUw5flMFk2KNPHnEoRwCd82Cqnw5pnDW21v8OhPulD
         sK5DIT8uXzlkz6VPhBXTe7YKRjV1n86wuf7kR2Vb9ZYvN24mS+9LrhAlypV0UYLBatTt
         aJ6nQfjWUz35KBm2urdIMUhr8T7JcTLF5/mm8VW1LXYxRS8oifyfkcaHGSUpafI49ZDO
         PUkekzThVDjJYeCWUSye1lpkmMB4ghi3f8kIhaVl0DSPhYpZXAuISMQaXTNrULXoTpB3
         H7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790856878; x=1791461678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2V8uPC0AzCmkid0pU7KtPQteVbme3oQvQ9onokkXOY=;
        b=KhKMW12dw4aj+etOkhJJVrVfMpAUUWVAXedsXm0K6D9q9EF0CGrHJQ00mdZiqK6XCj
         lgQdsXvI6rFz+aOHePaG2u76m2Fy/ZbQRDCbyEJjaOxFPmzD9mZngcO6PCrrKI+qRDdD
         Pd6TaCm1UtDMgUq8oRhlI/rB5nDqb6fFtg01fpD9ojhWaD0IP+qVKk2GWappFiv7vP25
         bGF0wbDtX4hEVy2Wi5Hfb4p/KCr22oCPy72+rphMDBb6cHZc/3H3uvwVk4Nn8VdbnM+7
         qfmawelBCrx+h/9WbRoXzz7OxY/DbjTpURgf8BKu6i+YSrs08lGaub8qzYAJs6k1R4G6
         J3Wg==
X-Forwarded-Encrypted: i=1; AKwUvBwS6VckgxaNMdeDFblA7CapEtB68kUtUYQyOVkcuPaPyRWwP8GLTjQvGGpvgYmmHdPzXWmiiOAYOZsHM84=@vger.kernel.org
X-Gm-Message-State: AFuF++m/IYs8SN2bDaaHM8mhdb5GNCWKyZkAK4krBTXwKCVaSnefwPiL
	QPBhtfln9SZY8oZaLmmMrZ/gk1C0E5lrLR0kafZBtQpmwP6y+gVDW2Umi5TZ0rFBOqAK6F8/XoD
	blVPGqh8OJrv8XI5wTF3KtIH/yHT0MBQQxhhrzrHDtpRfojpjllsK9l2VjWArdhWbLxA+VYZpie
	i4EOJAyuudRJLLF20MaaDXys8I2ceQ3qXeikBtSH3Ltg==
X-Gm-Gg: AYBFou1HTLPc5jgXmzUDlAUfG+9zm7t60L8m2UT1tRDK96KjjIa05nhluPDXzDmwq8m
	3r+/qwbm72a3C14ANhEdioMR9yKYeZNGanYz21dU/w9r0dSvZypTgnm90cPgDovdtzrYgUPzLsL
	/fuQj7E7R79PLVwo6RRD2VQ7ZzInMH79pZmTBGSTnfJdNqJiYyHKaMBR1uE6SrsxxgDeFBaKi0B
	R7SbAsTqhC9w80wXOZG6TvKXhCR5/C2TQV5AfufhA58Iuo24q7xHM9YqjRlZeM8/hkeqyPqwiKK
	rWAsmDDnGe+A8NQVs6g2xjicyZlQ
X-Received: by 2002:a05:620a:40d2:b0:93c:bb1b:b6b7 with SMTP id af79cd13be357-93cbb1bbbaamr275241885a.12.1790856878479;
        Thu, 01 Oct 2026 05:14:38 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:93c:bb1b:b6b7 with SMTP id
 af79cd13be357-93cbb1bbbaamr275234585a.12.1790856877804; Thu, 01 Oct 2026
 05:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com> <20260923-hawi-maili-camss-v1-1-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-1-cbbb42e534ef@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:14:26 +0200
X-Gm-Features: AclHuK_XuSX4ZePWnnpee2tgGkBBnS3UvugT_wZeMdgt7PGi5qaYm1CjHnboJlg
Message-ID: <CAFEp6-1Zvt0hhBd7LNx2hsyi9J+bxCT8EWN3jZ4B30SO58SCow@mail.gmail.com>
Subject: Re: [PATCH RFC 01/15] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: n3U3L7_Au8pBp26keocT8dzWmTzPGY9j
X-Proofpoint-ORIG-GUID: n3U3L7_Au8pBp26keocT8dzWmTzPGY9j
X-Authority-Analysis: v=2.4 cv=O8SsLx9W c=1 sm=1 tr=0 ts=6abe4eaf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=R4gLiKe44IeHqeJXRIIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0OCBTYWx0ZWRfX2gneYtor/wij
 lv6WuemRi5ssE0E9D4zuV5SiyFumIM83SkH0MuH3DabXJVqmTMcFR16EEdInmsqn0/W87lwCUjj
 3k9oz1uNKAhJBmcAruD/+yahvR+wCAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0OCBTYWx0ZWRfX1gYmoKWppDUp
 gB7L/t+n2ES/finCke1jftpCz4+axyY+dYKbOOpqni2GITX9U75c2OKv6O2+fWx+nW1bIXjIQFB
 4DS1wplIxse1+6Kbt/JUIHDYLx9VJx2Omn7W4UZnJNqOzXmPy3ZpAiqMaKzDbwZjdxMr/dMiokY
 cOg00VMRiUi7kei3Hb2KNtce7nb7Wu8lCJCRSRmWvB1JKtDeCB4G+lp8eNBOsEzfOnDp1C5AWR4
 uFWEW+di0vK23q/IcT5eoJuZvfiHwJWI1rFL5NYzIBx/0Kzwm9BM0/8RoFoMXx5dode4yBFus3A
 2qqUUAWghfC1vyClFWaXrVGNIE5U6O+k52eU0kYQPcgOpzXqU0fhCn7VFcOgvQEbyz3cASQZsjP
 Ew8SPQ6pvkgfZ7Aq3oj1vcVbgVbwB/v/vqSRxckLMpIdXguq3ttNzhrC1rhYaiWgT5tCWyBjm2Z
 JY2e/MmatqIcEHhtN3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010048

On Wed, Sep 23, 2026 at 1:02=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> Document the Camera Control Interface (CCI) compatible for the Qualcomm
> Hawi platform. Like other recent platforms it requires two clocks, so
> add it to the corresponding clocks constraint as well.
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c8=
73bace1764fb3e3 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -27,6 +27,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,milos-cci
>                - qcom,qcm2290-cci
> @@ -137,6 +138,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
>                - qcom,qcs8300-cci
>

I think we should stop falling back to msm8996. These are newer IP
revisions with additional features and resources, such as different
FIFO and queue sizes. I also plan to submit packed-write support soon,
which will rely on those capabilities. It would be better to add a
dedicated variant entry rather than reuse the msm8996 definition.

Regards,
Loic
