Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793699777;
	b=y0p8zfs8TCFwWu29cdIX4pnU9VzjUoXLp7zqmW9LWuHyF/E4VcuSoAicEbHAVT4saFhR
	 cQV4zbijj81R1PAAhNnOA5GVWxX1r8ojRNNPchnqMtJk0SsXcKuKb7HDg2S75qMOqTsNC
	 BpvAT/1iBYKUy2bf5Qwp/Kg3O0d5OmjKCvE2LEi5z2SdpdlobLrTrzYTYHORaYFNPziZ6
	 THPPqY771oDJnxnYQmFZDLxsx5ZVPML+A/aPMAhN+mhvg5wbY+RYtF/fKyzNN0a/bdypB
	 HieFYLT52Ery5Yj3zl4UzWzXyGFLy8+7qOpiTsJi1IvuKTvNz6U4uSFnHdmDVa1nkUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699777;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/hdNG9HXtDva252M4GklpccLFDdn1TQoFlQzO/EQSdQ=;
	b=eLJDDxgBejKUexyaGEh0BbNzovVp6wFWdRV5jzPoGYLMvYqh82OS7mb9E2ZnvUWZpZEe
	 xaUfWIseWYpKTpBMBLlHsymaRF8VVD06n4Ehn6iBrYnRzbvPJCK/JEvwNXPUGySvK2oyW
	 KMzGBcrbed1q8GnWj6KoYLVgsejQmmaepevr7q5W3ZUVYnwy/+GNIFyuwEd326WwT++yb
	 7gzxD9SkWuqrd+j9jgR8H69L0snv9iDdcjWobFRkCyNTgrhry8gyalwzXB5bKWedoEJJ6
	 TlbUNtzRX+jrGJuj5gphGZ9bZ5KqPnj0hj9CyirpIDbkVpr3N7gtbqfUppTlK1xvvLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jp4fSQmq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LaioP0F9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6823E606B35C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6823E606B35C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jp4fSQmq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LaioP0F9
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38vng52609017
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/hdNG9HXtDva252M4GklpccLFDdn1TQoFlQzO/EQSdQ=; b=jp4fSQmqWXy84gYj
	/fDFYa5X0XZjOn5dngtI0HHD2qrD8QQ/RAckIc7sMci1ns/A55i+ekzyXzezkoK1
	NwXmaXnQAXX9GVLrpHTgOepgqgW28MhyQFaoM+I3/g9CtoKJktnWW+ZjrWF8MN0s
	bJfq1tr9WR3s94ODdQakHMOOauxH23RunYZwxR/NLefkfGSGFAD1mJTlAb27kuBD
	M73MQQt77wU80hfFKFuNcWyyqS8zvHRv93wSKhEreC2C7OjocCvUe7sPfXkxAans
	1S2QHT14DGihfI+trV2Ajwj10QRbvbHOAXE46EUIrm/VZBxIAL90KUD7lZ4FSGZL
	8c/KHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d9hk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:56:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so636306585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793699775; cv=none;
        d=google.com; s=arc-20260327;
        b=Y+OO4a6OMap8fqSOavtesJg3xohBc/YYC9ZJ12yqLowoCfiwdyuGuWUuIywhKRWDIC
         pGUx8nP83CW/O+v+wxOL/OiyD8PbV05lO1MTpaV02iTMhbAfkYIPI8IucjERLVgezNWB
         NLh7Y9hjdu/AEQFG7mCWIoYoxpNa/iFEnVZ3UF7rKJDcO/SwsySmrXr/3A2DsDGM+Ogv
         AAWU+F75LwAYTbl6kThWs89DuKxVgOrGHl5pcB8Av3T8c8Mtw3fiwpjBiMNJ3C1xXtZe
         BlDFJLBs8eFa9TaNWzkpubjwfIU5Le6uKKSN3toW0rD7nKI2uV8GfuEYkP4Gu4sm2uOR
         wjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/hdNG9HXtDva252M4GklpccLFDdn1TQoFlQzO/EQSdQ=;
        fh=9Ny3/8DeibFwUnFLjwDsBnWoz4CVvEkSgv3h7Ko+tXQ=;
        b=g3r1yhS/qTwdiRpq80B02xLQ1yJKEhm1it1q9+Kyxgat8Ka2bvZ2SYjIA9n1PskFeX
         sp1F4f4nLSv/LeqmQtrl01B1nP36bbgyal7YVCg0QUSCiRFZuEUFBYVr0SRbD/lsgJdz
         B5WyTexy1KUEnvuN7Ul8Q89TETyW1HCxSqpyLpcSJmwSS/shQdvw4da/wYaRDzhq5fFr
         uaGvOea+Y/ME84MTIWMzcLCtNcQUBvdkIWr8SDLEvpTGx2Mf/1oaqZfZg8aHhQK8Q4tF
         S7qLQKjVJDEbE6qaDAvL1rY2jfGhXGBHczDwsi2j6O166ttNyVuuog6J5teAEyGaMwsW
         xgXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699775; x=1794304575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/hdNG9HXtDva252M4GklpccLFDdn1TQoFlQzO/EQSdQ=;
        b=LaioP0F9OB1A+eitQn5DL+QVLdRhbv1RIdx8clRnA5uafXMCzExPX7hOETb/4AdqKn
         EoknmucOa0roCr6iobXVSoJI+yztYxrw7z4a8tQ+EDmpl97CVA8zV5sf1akHQmT7h97T
         p7Y0Kd0B6y80EgxEc8ARbWJhRZpoLLvUx+AsjnFmy7OlF1Kercha3SNtMnMDTvZIUTtK
         GyUEK3uqPZSPv6S6AjO/aZ82FoC2wIynBBH4X1yg1QN+pwSBKQJxd4H94sE94vaXDhdn
         icC0iT4hUY+xilwfWI9DSyQGtFtreXrA0XcmA1AIl9+hs/9TCXrkoazZoLKECXoD9qIx
         HEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699775; x=1794304575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hdNG9HXtDva252M4GklpccLFDdn1TQoFlQzO/EQSdQ=;
        b=NjI2euNJyZS0+FZ78iFWMOnO+XEYrboMB/fMlthIjn9yZo9HLhUmFeIzNAuFDz2E7w
         qC5HuQ0TzMpwFS5sKiLSmFLGtGbxj2u603z77lDKa+F01PqxnenAyVBo/Av5kU0ukOOB
         0hlWtwIQUlaihbRni/tP38oKunD616oOir2Tk2IO2L8DUn08s1gl4RcbMMYuQC8iDdLe
         k4rgT41GVp4h90OULq4WocGtLXbngUrtNh1zn1O3OjD8fSyJtqHuKgWWvEuWNY+4W0R3
         U8CMg4yN6Hb5DtzVzWAwSGBVddXPiJppgBMlXCA+bnnPyf9RMyH3hSI678CbZGZ57BU0
         RabQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZZoqrL01IJ38dgDgutl84ydlqxEX9mFncexWwMrDEKvJIagKa9bNdPUgEXBRaME7coYsSa8ZZOfwf+2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0FLbWE8Q0yzCKAs6NQw21Xgq+0itMN94jD7fqQo1GA5CytTUI
	d4YPTs1i7PpNz7p74T9nBfx5iNCXtfsdrXiyE0QWXnnuAmHhEpL0X1J1PiyGU5GVhbD8rhws07T
	yM/Xy0bGO2qjQ78T4B/ak3Smi7sMxyE4Pip+Z3ER/CBLSf2IByjKSiFiDRU+7xPaUjT63Gmai/r
	Itr5Br2BAMGwtWKYz5/KkYWta3zH/tQgm21A7DSpD9sw==
X-Gm-Gg: AYBFou03ZB9s8OKBzasVt7TfY10BPBo7+6QmP08xdITbBXqLiuX8JlERIGzppDRN7dq
	fRXhZuYQhufZvpRMyXotgLsJ9cr11YQ3nEF/29Xoav/D0SpFKBJr6rY4cEvSHoBiNd6nDHWdbRe
	B2ApGusos9XuxtShQGHc19lCZytjBmIoGj4TSdIDIZ0tKTK02pS5UI6NVttY6uTfxdBvgyaTWVA
	cS1jClbRQF4ysAIiwQjAxcfV9YREB2xD041naFpVk7j8RQ0MLGMfOwRgwSRdyFTjor9ts6bxE8=
X-Received: by 2002:a05:620a:880c:b0:93f:1936:b229 with SMTP id af79cd13be357-944217ee7a9mr1723919185a.77.1793699775504;
        Tue, 03 Nov 2026 01:56:15 -0800 (PST)
X-Received: by 2002:a05:620a:880c:b0:93f:1936:b229 with SMTP id
 af79cd13be357-944217ee7a9mr1723918285a.77.1793699775099; Tue, 03 Nov 2026
 01:56:15 -0800 (PST)
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
 <CAFEp6-25K=DURpYM96o8vMO8pkVr8uf=r2RAP-kcM=Rme=8JgQ@mail.gmail.com>
 <95d29a93-fcd1-4aad-a6a9-711c8adf3854@oss.qualcomm.com> <CAFEp6-0RMZuQko=DdJmpGg64piMX-udW1ZG0jpGkHNTuU7ozqw@mail.gmail.com>
In-Reply-To: <CAFEp6-0RMZuQko=DdJmpGg64piMX-udW1ZG0jpGkHNTuU7ozqw@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:56:03 +0100
X-Gm-Features: AclHuK_pmqDcrytSHWMhzN4Ld6ZB-fkhi66IDifMLpwIrl2Pk5ie9f2nPiJJaF0
Message-ID: <CAFEp6-2f6Bgv3btgry=hjeNug5UO301-9a21G5VeiUsUi6P9=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence tracking
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae9afc0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=NQhdVlSQwCN5q0FL6oYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX+C1J2+TwpW0e
 jSAtTB8fJjsYPm7ElpHmq3OrsOfi/fDyoDjl3bie2VM8R783nvKUbCGygSSoQPtuVN1DHlGPhL3
 iWA6V97w1EiRcmb2A7dNIk0MsWAZQYQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX4+/r7GKdyN0Y
 73S1pX4g5lUDfGIXv8JJG32LCHDJRIpMfGEA5lSu/k1a9ii/4EXhrbkpjbBp6QawAo/aFOFcfIw
 rj52GpMJWAbvuMzAZSBJstYqStlQD2c66j/YtUVhg055Ci5lLtJ4AcyTZoCmGT5W/UnOMslfZH7
 VRkTI3JXgFHgcBnBggXYSKbKf5AmQcrDhRPbQfxDDAQOAA7f5XbsCbDIU5xcTBSFhobP1zfKu6z
 a9ekBVUBeU/upbK/oVyiikFI4w+XSkvrQ1BkJvtjDEbSnPA6klNB9pYEzJJJ/aMXsro5tmkuXSx
 zncIIodKFLyFoh8xQdrL3OeaKzUy3dIZLCcf3qocV8fkug26kaQDqDScRBr3hdAoEV3CXNOhO4O
 ASaR8pjhN/CVbjsQhyIVS6O7iAtxrHxy05Lb9PGB2HEqjY6AudYNruBOgElAaJoRtAXfDrYukLi
 DNXOPC9jA5jPXXBrauA==
X-Proofpoint-GUID: lYusnfC3IpPUjT7wd34JaqqHS6b8HmCe
X-Proofpoint-ORIG-GUID: lYusnfC3IpPUjT7wd34JaqqHS6b8HmCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030039

On Tue, Nov 3, 2026 at 10:53=E2=80=AFAM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> On Tue, Nov 3, 2026 at 10:42=E2=80=AFAM Gjorgji Rosikopulos (Consultant)
> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> >
> > Hi Loic,
> >
> > On 11/3/2026 11:33 AM, Loic Poulain wrote:
> > > On Tue, Nov 3, 2026 at 8:11=E2=80=AFAM Gjorgji Rosikopulos (Consultan=
t)
> > > <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> > >>
> > >> Hi Bryan,
> > >>
> > >> On 11/2/2026 3:56 PM, bryan.odonoghue@linaro.org wrote:
> > >>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > >>>
> > >>> In order to communicate to user-space CSI2 SOF events we will need =
to hook
> > >>> into and control v4l2_ctrl_subdev_subscribe_event. In-line with oth=
er
> > >>> implementations of FRAME_SYNC have CSI decoders which support the e=
vent
> > >>> always generate it in our case if and only if an atomic user count
> > >>> indicates it should be so.
> > >>>
> > >>> A flag in the CSID descriptor indicates if frame_sync_en is support=
ed so
> > >>> for each SoC that supports it this flag should be true. Since bool =
is false
> > >>> by default no negative enumeration of existing or in-flight CSID is
> > >>> required.
> > >>>
> > >>> Subsequent patches will enable on a per-CSID basis.
> > >>>
> > >>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > >>> ---
> > >>>  drivers/media/platform/qcom/camss/camss-csid.c | 54 ++++++++++++++=
+++++++++++-
> > >>>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
> > >>>  2 files changed, 65 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drive=
rs/media/platform/qcom/camss/camss-csid.c
> > >>> index a00791b00feb7..e9b399fcb9c7a 100644
> > >>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> > >>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> > >>> @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *s=
d, int on)
> > >>>  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
> > >>>  {
> > >>>       struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> > >>> +     unsigned int i;
> > >>>       int ret;
> > >>>
> > >>>       if (enable) {
> > >>> @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *=
sd, int enable)
> > >>>       }
> > >>>
> > >>>       if (csid->phy.need_vc_update) {
> > >>> +             for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> > >>> +                     atomic_set(&csid->sof_seq[i], -1);
> > >>> +
> > >>>               csid->res->hw_ops->configure_stream(csid, enable);
> > >>>               csid->phy.need_vc_update =3D false;
> > >>>       }
> > >>> @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_enti=
ty *entity,
> > >>>       return 0;
> > >>>  }
> > >>>
> > >>> +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, =
unsigned int elems)
> > >>> +{
> > >>> +     struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2=
_subdev(sev->fh->vdev));
> > >>> +
> > >>> +     atomic_inc(&csid->frame_sync_users[sev->id]);
> > >>> +
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> > >>> +{
> > >>> +     struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2=
_subdev(sev->fh->vdev));
> > >>> +
> > >>> +     atomic_dec(&csid->frame_sync_users[sev->id]);
> > >>> +}
> > >>> +
> > >>> +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops =
=3D {
> > >>> +     .add =3D csid_frame_sync_add,
> > >>> +     .del =3D csid_frame_sync_del,
> > >>> +};
> > >>> +
> > >>> +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l=
2_fh *fh,
> > >>> +                             struct v4l2_event_subscription *sub)
> > >>> +{
> > >>> +     struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> > >>> +
> > >>> +     if (sub->type !=3D V4L2_EVENT_FRAME_SYNC)
> > >>> +             return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> > >>> +
> > >>> +     if (sub->id >=3D MSM_CSID_MAX_SRC_STREAMS || !csid->res->fram=
e_sync_en)
> > >>> +             return -EINVAL;
> > >>> +
> > >>> +     return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops)=
;
> > >>> +}
> > >>> +
> > >>> +void csid_sof_event(struct csid_device *csid, unsigned int id)
> > >>> +{
> > >>> +     struct v4l2_event event =3D {
> > >>> +             .type =3D V4L2_EVENT_FRAME_SYNC,
> > >>> +             .id =3D id,
> > >>> +             .u.frame_sync.frame_sequence =3D
> > >>> +                     atomic_inc_return(&csid->sof_seq[id]),
> > >>> +     };
> > >>
> > >> On first look this was looking strange because the id is used for th=
e
> > >> control id events not for frame sync. But on second thought it may m=
ake
> > >> sense, but the question is how the userspace should interpret those =
ids?
> > >> As of today userspace does not have any info for the VC and csid int=
ernal
> > >> pipelines (so called lines). So with the current state of the code
> > >> the id is VC which makes sense becouse the SOF/EOF packets are recie=
ved
> > >> based on VC. So i am thinking of two options:
> > >>
> > >> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-dev=
ice
> > >>    and will be well known to userspace for which line is reported.
> > >>
> > >> 2. Add and propose extension of videodev2 documentation that
> > >>    id of frame_sync event types represents SOF per virtual channel.
> > >>
> > >> Personally i votoe for (1) because it will well fit with stream-api
> > >> support and usespace will have clear understanding of the SOF to whi=
ch
> > >> stream belongs.
> > >>
> > >> Given this in mind it will be good to open discussion with Laurent, =
Sakari
> > >> regarding SOF event with stream api and GMSL cameras.
> > >
> > > I think both approaches can be applied independently, forwarding the
> > > event through the VFE as event proxy would likely be a straightforwar=
d
> > > addition.
> >
> > Yes i agree as well, but the first need broader audience and agreement =
what
> > should contain this id.
> >
> > >
> > > Note that the id here represents the interface index. While it
> > > currently happens to be associated with a VC, that is not necessarily
> > > what we want. Ultimately, multiple interfaces can be configured for
> > > the same VC.
> >
> > Yes and that is changed with stream api implementation, and the
> > following question: what should be the ID when streams with same VC
> > are routed in more lines (hw pipelines).
> > But that depends on what this id should represent.
>
> Yes, then maybe option 1 is the way to go for now.

Also noet that vfe_hw_ops already also have a sof callback already,
maybe we want to do something with that as well.
