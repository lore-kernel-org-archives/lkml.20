Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793699647;
	b=WMWc1FLEvYpG4Zx7Ne7TETk2buE8uuucs+jBs8bjut7Z7G+7xVsDjkirFHaWUboCpUDb
	 4X1E2gwwHRXZwXla3pGq0zg+PJhwgq6VuAFtaaSAc5dgXFVDijJuCQ33eKkhrXE67m9ad
	 VkTuW/D6ijp+nBsWSs6b/K91zADn4Run1yA5BMAUMEv18UExIT+is3jqT4fFo8Bh2Jrpo
	 6fwtm16++cFWt3LA83PDl6TT7uF8RlvvdkQ0LIpP8OyIAi5AkXcfXYYysNCWsWr03wbW/
	 goxC713LQdqVE0XT+Ea/1W9LJcensq5urLNf2iZS7OoR3PDmi3m3u5g4eZtEWa0pwuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699647;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cX610U4zZgvHeWzBdDrzgM12xQ9BuFkZ9gMwlpEqOB8=;
	b=Kw2M0x0kcdDYpt89OJ8UyJT4olL0dO3ajA/vEOqDNgK8XDNwYnE2ATvBI/hT1qZg7gT+
	 Oq1shC3a0ckDYLpqUmk81V5vbBlDey+tAUykb+Vicpscevc/y6ldWvUgnfOeN7vV7GH9c
	 gCVxDJny/WeIjeq/x1m9eAfejp8RsgZkLJ9L26QIDm5h/ZJcWjIinYMySAVAW1wn7427S
	 +kLXVzHXiaSakG83npzqZQjA4VcEhIU4Cm1PC4yq5c+iakmsQur+vfLMqbEYc4vxn0zeh
	 1joJjB0W+FsxTV0WauOVoP9HfjuzOn21p8jkXd5IqSzzvYxM1BA9+IE0QCqWJZagLig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="o/EQdLKf";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hrAWVlej;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CBF606A33B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37CBF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o/EQdLKf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hrAWVlej
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A34h7GB750935
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cX610U4zZgvHeWzBdDrzgM12xQ9BuFkZ9gMwlpEqOB8=; b=o/EQdLKfs59bGx/J
	uKseIGakkcAjOcXXSfxoAZkvuoUyAK7dNIUE/eWrSXijZgbj7t6jFWpfi1PVZqgi
	myUsowxh8Sfos0PEwRvPX9eXjpYADiYximefN88a+aOatON8sAG6Ic+TZV/h0fpG
	/ucIqPtVQh1rsjhBSxo2l9akvayYckPk9twM5bZ+DNR/Mg54R5tWNdme7GtTobnK
	H5WLuvzFeOGybnF9iKFIXZmHXGBIyoSdaWUL4fhkfA60yZsNdyBtDjYxxvxbko4d
	xD6beOuV4PilTHwcla1sgwu+a6xrU6NzEmkOp7cm8nScrl52GwpU/gT+XZGVCt4I
	eVS2sQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5h65u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:54:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so569144185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:54:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793699644; cv=none;
        d=google.com; s=arc-20260327;
        b=MFNaInC38prHrpPUSx6hIi8hUq2bAWMNhskmEsw621DPbRu536lAutKEzbO6cbhH/B
         qOIiAInwJOSCmbtmXPG8p/+Rn6GVMC6ZsqYC5dsgJ6bqkamjsWvyO2QuTHjkzq8V/YdK
         HVWgfszTuEthtCeHsp50mau05XJr/UCbf4o9rkGFVjNdWGjclx8WYoOhXcOzUY58He40
         JLBrcYz87LFeHda19xP4CIuRGo0WmDFgaC/VO2X2SZKENBL/MVhfzttfcmj6H+tkBvl0
         L1P8M42q2YFA33eYG1x5DJbnRXwjlLfhX15TRb+k4tyYLbFayaitRAenConxkrj+qwZF
         OGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cX610U4zZgvHeWzBdDrzgM12xQ9BuFkZ9gMwlpEqOB8=;
        fh=rwtIkrkSFOw7ijiMJ9HFX0WsSgB08W8ksHHEORna3ig=;
        b=fXQ+ukSrPWOoEPIYg4Dv4lcFyvE8HHla5dYH4s45v60beRMY2aPP2BeDaBJrXz3wkP
         dSGZW8/jOCT98qt7GER3xl9DKynj5H1X3DPsXWiDMBr170n1FqfExH0UTHbBij2lP5/G
         6JU5Fu7Ea5Lo6Rc1nHnqk+e4cIuRB0N3idqa0JClq/mN+K9PGkS6qRSh5Wdz0PvcTIkP
         cQM5WlqnRoyjJ30B1/tHf6m+2v0nS6G0gEZm164A02m+vIWxW0/S73C9+MkvS8pqqDPf
         Nsz9mt4xAtLJnIfDKjF6I5cpDV1FzHkeyKz70gNnc2/HOYGBjmJGRTuIVA7y5eVxPQru
         HIsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699644; x=1794304444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cX610U4zZgvHeWzBdDrzgM12xQ9BuFkZ9gMwlpEqOB8=;
        b=hrAWVlejvqXS1yJdkcfRcXSx7hNArUoeWMNFY0rhGJZbWJbAX0vx4uDrf0Pncwtop7
         jg9nfGdfGyvGrTasB1NdhzHEn1CbwXH01L7QD45fnrhN0kWbtwZRrYC3RjxPHDwNSN8O
         0xjAdsFJHXFfhWkBSVtvurhVcqPQFGVZowxDij1nx4DL8zUUAouw4xRAhKk5uW3Y7BgK
         cvOYZQgo0ywMT2ZpSvkKLChSo+TsiBhyaxpfX5vm1Q1qBNB9vqqBNUOGBx+3mmupSpIa
         vOJOvvM9+AlpRWuNOk/hOgjYyfYDcho1nO5kVT9x1CvB+k9mBnGLHuMyr7zqqiFFHEsD
         w0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699644; x=1794304444;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cX610U4zZgvHeWzBdDrzgM12xQ9BuFkZ9gMwlpEqOB8=;
        b=V87rg9O+iZfebFp4XnjEqTgi8RsRCELXrXKR4KXUf17XIN0i3ztWdUy90vOX1jM6mS
         0q/kVz8FvTj0j1MW4IHXpaxAu3+qAlg/KOYMliZ8yTnJI08ukeS9pXQqU2u8XBZ/blgA
         l0bhQ7FPE4KsvxHC6EaSJ80mwS0Fk/7o8dB3OjABzpQhh1rorYFz0PTjFe0V/fkBD/Xk
         336fOLywcSKLWm6Fhi96c6Qvrw4G469IjTQTNK15K4YfIxeyHIzLfNXHZ+bKzR6PdowP
         J9vhXmq6+DNXuCwA+ADOtehO8ofAVTtQ8BgSrfE4lIc1eQAF3G3YufAbF5oiHvYpQo1V
         oJRA==
X-Forwarded-Encrypted: i=1; AKwUvBypjq+j9nbT18yOax2jWdXnH1aXS2GZN6Nd7DGes/V3WSuKiNKIQEJ3jaN3Ewu7XXRILuZhQxeybtxrrZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kKkTDTa0jHDSJnBVBbwp1euv7x1Yx6scoiuFjAgtZBp0XeTz5
	LrALT83xIqgPKB8soxwqIFPkj2B4BbXJ+3Q+KJ4b8NI2Qg/zT4gQeGAApVOtKe+xd0SoPpXp7QE
	NYXjOIgO4ks1TmNKz8pgGFMPHrmvS1NtcHNLy3bsVJ5Uf9NioGhQhgA/kSzzZLCHEQaUbI7QLCg
	yOtWGPqcC/RWUG7NqlStT7uWVpwC0OB17IFZ5ttOyjiQ==
X-Gm-Gg: AYBFou33D7rHTrmZbBSPr6EnDzSEMMXQVmwGSc2rNaLsI1QtubDc2RMi0U1eq7CRf3s
	rUdu3SwS21bGEnOh5V7piisjKjf3PY1VIuaBF+B0TX5LdRyHYyKJjN+u1ThIgL6LITtz24Ht5Gl
	wFc6VrALtRPeTOOE5eA05neB69hmYllxwNWgob0IAET9jysZ4mFkyH+nwY0WZG7lgAv7rBMIlhp
	3xY0AXprbB8BLuwEfKYJb5d7kApnFv0D2ji3vbU9mK9e88lUT+bF11fYEFAbzD27BVf78VeQBU=
X-Received: by 2002:a05:620a:4153:b0:93e:f9ba:690f with SMTP id af79cd13be357-94421737147mr2073343785a.73.1793699644351;
        Tue, 03 Nov 2026 01:54:04 -0800 (PST)
X-Received: by 2002:a05:620a:4153:b0:93e:f9ba:690f with SMTP id
 af79cd13be357-94421737147mr2073341285a.73.1793699643774; Tue, 03 Nov 2026
 01:54:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org> <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
 <CAFEp6-25K=DURpYM96o8vMO8pkVr8uf=r2RAP-kcM=Rme=8JgQ@mail.gmail.com> <95d29a93-fcd1-4aad-a6a9-711c8adf3854@oss.qualcomm.com>
In-Reply-To: <95d29a93-fcd1-4aad-a6a9-711c8adf3854@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:53:52 +0100
X-Gm-Features: AclHuK-p7UhawPaFx7F6Xj5AwKLrYkPyGvAGmkRSwY3CzgDPwBqFDX8qVO1bUZ4
Message-ID: <CAFEp6-0RMZuQko=DdJmpGg64piMX-udW1ZG0jpGkHNTuU7ozqw@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence tracking
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: uZVZNa0zrP2ztqIg9DiMdfkRDH8hqtl4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX+y0HNIHt/Kpa
 KLq4TvIvLwqDigYzyWSNnwtKL6EKmZwPbDYsH303h8zq1xNesj+E4eT11NkFBoYr60IlAtBvY1z
 S9L2OLU9iwmdxHU/kri4qx3AAUWP0wQ=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9af3d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=GZQqk_n3G85zXuATzoUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uZVZNa0zrP2ztqIg9DiMdfkRDH8hqtl4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX3ribxPFy3C6r
 t5ZvKrQTJzZu/ctigad23edwiwb5vUkJo5CJzOfMYIyjLFDfPX5hWO9acFj4yXZgG/OGuzCMtul
 R48mankqcuLcgKJAcPN/drJgUT8t3nFi7Oy5zcMsiNFOm2PUNiv1wXObivY1bQuuZvLcTvmNc5W
 GeR+pZtoo1eYcVOLngkdRXgvLT2JatU7OysjAu52a2J4EfXljYDYkbPbQO7e5BjF3Py2GbxN4yE
 xKKbx5kPGC+HZrw9CgENu/Ak5DrrjDrEQjwIUAnE/zFRcDUAPV83grYvWa6pbJbgXZR5TAX2mUz
 0XArKsxIb9AYxuXG0cku7UYAm7Cqy7VC5uHYm8p4YTihVDaohVvJmsASNG9aQhZi/VybzM4ss/a
 PSmSWeRNM187CXdIRaXZ4o7rOUxu4Do23Utt2MG2fo4oMyfXC6xC/7V/2aMLRqGmz8Cv/wl3Dap
 arZUb66KchT3noedtUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On Tue, Nov 3, 2026 at 10:42=E2=80=AFAM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hi Loic,
>
> On 11/3/2026 11:33 AM, Loic Poulain wrote:
> > On Tue, Nov 3, 2026 at 8:11=E2=80=AFAM Gjorgji Rosikopulos (Consultant)
> > <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> >>
> >> Hi Bryan,
> >>
> >> On 11/2/2026 3:56 PM, bryan.odonoghue@linaro.org wrote:
> >>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>>
> >>> In order to communicate to user-space CSI2 SOF events we will need to=
 hook
> >>> into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
> >>> implementations of FRAME_SYNC have CSI decoders which support the eve=
nt
> >>> always generate it in our case if and only if an atomic user count
> >>> indicates it should be so.
> >>>
> >>> A flag in the CSID descriptor indicates if frame_sync_en is supported=
 so
> >>> for each SoC that supports it this flag should be true. Since bool is=
 false
> >>> by default no negative enumeration of existing or in-flight CSID is
> >>> required.
> >>>
> >>> Subsequent patches will enable on a per-CSID basis.
> >>>
> >>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>> ---
> >>>  drivers/media/platform/qcom/camss/camss-csid.c | 54 ++++++++++++++++=
+++++++++-
> >>>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
> >>>  2 files changed, 65 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers=
/media/platform/qcom/camss/camss-csid.c
> >>> index a00791b00feb7..e9b399fcb9c7a 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> >>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> >>> @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd,=
 int on)
> >>>  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
> >>>  {
> >>>       struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> >>> +     unsigned int i;
> >>>       int ret;
> >>>
> >>>       if (enable) {
> >>> @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd=
, int enable)
> >>>       }
> >>>
> >>>       if (csid->phy.need_vc_update) {
> >>> +             for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> >>> +                     atomic_set(&csid->sof_seq[i], -1);
> >>> +
> >>>               csid->res->hw_ops->configure_stream(csid, enable);
> >>>               csid->phy.need_vc_update =3D false;
> >>>       }
> >>> @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity=
 *entity,
> >>>       return 0;
> >>>  }
> >>>
> >>> +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, un=
signed int elems)
> >>> +{
> >>> +     struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_s=
ubdev(sev->fh->vdev));
> >>> +
> >>> +     atomic_inc(&csid->frame_sync_users[sev->id]);
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> >>> +{
> >>> +     struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_s=
ubdev(sev->fh->vdev));
> >>> +
> >>> +     atomic_dec(&csid->frame_sync_users[sev->id]);
> >>> +}
> >>> +
> >>> +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops =
=3D {
> >>> +     .add =3D csid_frame_sync_add,
> >>> +     .del =3D csid_frame_sync_del,
> >>> +};
> >>> +
> >>> +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_=
fh *fh,
> >>> +                             struct v4l2_event_subscription *sub)
> >>> +{
> >>> +     struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> >>> +
> >>> +     if (sub->type !=3D V4L2_EVENT_FRAME_SYNC)
> >>> +             return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> >>> +
> >>> +     if (sub->id >=3D MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_=
sync_en)
> >>> +             return -EINVAL;
> >>> +
> >>> +     return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
> >>> +}
> >>> +
> >>> +void csid_sof_event(struct csid_device *csid, unsigned int id)
> >>> +{
> >>> +     struct v4l2_event event =3D {
> >>> +             .type =3D V4L2_EVENT_FRAME_SYNC,
> >>> +             .id =3D id,
> >>> +             .u.frame_sync.frame_sequence =3D
> >>> +                     atomic_inc_return(&csid->sof_seq[id]),
> >>> +     };
> >>
> >> On first look this was looking strange because the id is used for the
> >> control id events not for frame sync. But on second thought it may mak=
e
> >> sense, but the question is how the userspace should interpret those id=
s?
> >> As of today userspace does not have any info for the VC and csid inter=
nal
> >> pipelines (so called lines). So with the current state of the code
> >> the id is VC which makes sense becouse the SOF/EOF packets are recieve=
d
> >> based on VC. So i am thinking of two options:
> >>
> >> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-devic=
e
> >>    and will be well known to userspace for which line is reported.
> >>
> >> 2. Add and propose extension of videodev2 documentation that
> >>    id of frame_sync event types represents SOF per virtual channel.
> >>
> >> Personally i votoe for (1) because it will well fit with stream-api
> >> support and usespace will have clear understanding of the SOF to which
> >> stream belongs.
> >>
> >> Given this in mind it will be good to open discussion with Laurent, Sa=
kari
> >> regarding SOF event with stream api and GMSL cameras.
> >
> > I think both approaches can be applied independently, forwarding the
> > event through the VFE as event proxy would likely be a straightforward
> > addition.
>
> Yes i agree as well, but the first need broader audience and agreement wh=
at
> should contain this id.
>
> >
> > Note that the id here represents the interface index. While it
> > currently happens to be associated with a VC, that is not necessarily
> > what we want. Ultimately, multiple interfaces can be configured for
> > the same VC.
>
> Yes and that is changed with stream api implementation, and the
> following question: what should be the ID when streams with same VC
> are routed in more lines (hw pipelines).
> But that depends on what this id should represent.

Yes, then maybe option 1 is the way to go for now.
