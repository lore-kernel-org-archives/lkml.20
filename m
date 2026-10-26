Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793001611;
	b=4B0qAsspVnB0ZB2m1nNo+2pnbKny3f+GypzZbm8OjywCExeWJNgGleN50XbMN3Z7JXHP
	 JkUPVFt9v3UavYJqGGWSxusHSeVMzvTjpC4JeK+lz79BLt8BNbEEkGi9RfIjEXstv2yLR
	 YRQbQWl+IANQJ5LmMm8Pk3jnYOPhqI8Dmz4dwxnJw85lt4K98t43frS6xGegfbG/cEduy
	 J6kvgUSDKVDbl0gBUsdgBbEMuGv67hhjok+ON6uIaiX+64cmk4dtbFnVxF1RTFfgIyNfM
	 I/jgtwngb/V1TD0pPZuhE1tDGsxUaBk7A+CbnvBxS4HMeH0NCmnleVMURa/fGD85sqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=au0nJJfTAenaS/cmlQ5XpkmAU0bmNiL8uh1/Qn6Cv6A=;
	b=KJBbsBf25PXomlUosGOVhvPWzeGeS1NDbDt/mnQ/cQtShDO6ty4MBF7V0iY6krbyo9OH
	 MF7/ynJ5kUTvKzhOsB3bZKCkwJWBDnD0tpBpFOEVueUBzbLJaF4tde49k/mOYMwk870Sb
	 jPGoZAkZz2Lm52OhVFzjnjqCaC1FhqU60XIBkV9J4oNtdueHDUH4EsmDqPYPwWgarjYl6
	 FAb/Chncb4ipwSa0YgixgvbCEELYcToKbJb7oWmG9agSe7y75STGrq8uQO5ksuyeIeg6/
	 aUw6ucbZH4P1/MFmDz/QnvXfxTnJnh5kclOuaO10v8uiCMICBIkBl03hqdzZVHZezzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZNNPCyc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUgYoZLj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63F2606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D63F2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZNNPCyc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUgYoZLj
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b1re2206193
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	au0nJJfTAenaS/cmlQ5XpkmAU0bmNiL8uh1/Qn6Cv6A=; b=FZNNPCyc84uvbmU2
	vLsuCZW7hbFubv78YAxU64lJocnrpHdoL9Uwlk3a5sKT+x2V0MpzVOlBQlz1wV8m
	AmyXiOR2d21OeNNBzEHBFcNQuoBn3mYmDbEZ3AOSXcn5H3M8l7ToB1fax0nKrg/l
	8PyyJUYNXqoOGUcqSNuEse0Af3VTl0moMF+I0LyCczV1KwhnsdrGXcuYEmAMCCNS
	IKe7Iw+AzMDdHKE45s+g5FVoKDCUQtNOq7dQXxVdZQ1IxMg/x9852a+L2bmEQWNg
	S/QCAURezUc8uz3Xc5s0x5qXQ+5CFkxwqEpipt3YJLUWpP6avPzy3cfDYlEuiL40
	Ye0FVw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrunc4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:00:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso2562180a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793001609; cv=none;
        d=google.com; s=arc-20260327;
        b=J6zvjnBLXOf/rgdj76Y5jZwGEMT2sdut/XX3fF9jMtnwNtcG7kYdqg11IxrzYyOjW0
         MmpzloqRSR9CFl6dPsyl1+a6KAgkPHm2oxhiPSovzp1LboQTSXtS6y78Ngoh6N7E6G3y
         mUEfGW8264vCs1IO+ovfMNGyPBw0kEU7vH2uYogvDhl/MmnDixiEU4QqgWGdlSN+fQCc
         xlGxIauv7c+KPIKAEmc/wWMfVXcLAvx9+zlr4s6Y9gspbHmLwD9sz/U4Ysqxwx4YZ+hE
         1Xn6j7G/VzqKEow9TG8xTjJJEjoG18zjNYr/IFWpG+ZMDIZ4LI0b+4NXbqQ5CoRZkyED
         FjMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=au0nJJfTAenaS/cmlQ5XpkmAU0bmNiL8uh1/Qn6Cv6A=;
        fh=AYUVNzz5ORCA897ehyFmp6X1WFC2l/O9GemJgeVWJZ0=;
        b=pRs+ZxMBe44PNul4VY84qF/qqeywQfDPn1okx4WsyrO3jcfZWJCyYGwFpEE+LJnYKd
         zqe9yJ/njrnmJvdfDayPlmjshE6QvmH/wVn3ad36XDKVZgptyrqoCslaaOuNIXXnWlPl
         fLi31dlwe4s+4GpDOmmnDUveusvUjX8at0YguzCA+BIYLViSFmjbeIr0dUsmHIUgZFMR
         6GIyf03HP97ltZ2TCHSm98DpYBb9UaX7PCXR1Sr9/2EPD3rg2wPWHyIpggx7SYZgdHRA
         eFxiWGnbf4JfXHPZAHDVwvWXeNnvpAijXOR90078FpiDExYOZ0GZfPv0pHTjSUIlpwK5
         36mA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793001609; x=1793606409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=au0nJJfTAenaS/cmlQ5XpkmAU0bmNiL8uh1/Qn6Cv6A=;
        b=VUgYoZLj2Ul3mH9AcX6oFoU764ymNdteIlZhSQ5OZP8YdLtxN5AzMI7hT3xvDZ7UVq
         K4DGYKT+dMR15vrtDJ5Q+euaWHV9wChoPhWJqgV3WDkjEqSURiYyrWy/ogu5GGgj2mKq
         h+V9oQm22fUZWc2jdugm2IurYsI7pa9WGZpxdsYIO6alpvK7s40ysH4rcvD9SJ1sPLZc
         LltzTdb1uWUUZErSxdmXsP591D0IpHxvqTirlwMVWTMXtLl4TJplD/oYvyX1rt6S6jSS
         JPush5E6rY2TPM2+iQ3sMxmmR83YWSgGlLq9XlSbhIrDnGOJzB52qSunL8f3u/vqOHdZ
         9q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793001609; x=1793606409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=au0nJJfTAenaS/cmlQ5XpkmAU0bmNiL8uh1/Qn6Cv6A=;
        b=jIZk9BHYnRAtcD8hOesvsRb42vZBAZAuUNJ5BhErUMvv5wYddS1sN19300H1Z8qhOO
         ingrPk7QU7HTn3Be2Q4Y/pZ49EptiDVZx4cMiUw7clnMyXwsak+eHysAOOv2FHHnWQJ1
         zW/d0XcsHdRKIEGRS2F3HCnxItmgJlInK6gQJSihHHiZ4BwUWVZKdOobc7L0a+fLDFsT
         vprG0OnbUo8ddyXsLik9Z1p+9jE2or0xiUBiKRD5TRWFNkZ/qDVlsIe/9PxzuiUduDv5
         AM0y0ufjQ9CzV8TlQfwkfk3cQZ6HgOGcAD0+aowlVOrJa59MxnwdStaPY5VZRb5op0wU
         vbqA==
X-Forwarded-Encrypted: i=1; AKwUvBwO3Ytdh8vsUZXGn+Xe2llVmFzyArHa2we1UdzcVAsCtCVcFYSNMGWXjfQZt+mdRXRi+mVGMGrJWjUl9Zw=@vger.kernel.org
X-Gm-Message-State: AFq9FYITGMVIf1SnzQncN/Nrkqmz0aP/JLGWwzA5x9MD6wi9cSZ3p+4M
	HNZ9L2hVGQnI86rJ6aGym674qnEr42CwBJTK506YlvIzp7glHB9qgafThbWrCct9AHqCihcZGWQ
	uxIU5PvEDt3Alrf7d5JHRalZJqgtigOoqC02206LZ5kisWhkCpDUXVScFtxTwEqavkVDgAmv69K
	NK3xBcBKX4kBILTmJZ4f83DzgCN5qA9d/qlsWeGHI7Hg==
X-Gm-Gg: AYBFou1mueD7z1BEPWAjmnS1bTuyscB6XhDsu4oGC1TqUd00dRtLk2hTqjx8b4pJtYI
	9uDlKkLM7SPxS5toOny2WIgNVslux0OB+jcKFZghqLkwfEgUhhNw9Jd7WiVOcHC1cnUeSQzJKpZ
	F2aqH/fpSz5yQewn6h80Xz7S+dNRm+q6mqpH3EiXyLV+bxfEfIEaQhXTYl3A==
X-Received: by 2002:a17:90b:3dcb:b0:3a8:9db2:a4f with SMTP id 98e67ed59e1d1-3adeaff8065mr5626668a91.51.1793001608592;
        Mon, 26 Oct 2026 01:00:08 -0700 (PDT)
X-Received: by 2002:a17:90b:3dcb:b0:3a8:9db2:a4f with SMTP id
 98e67ed59e1d1-3adeaff8065mr5626619a91.51.1793001607894; Mon, 26 Oct 2026
 01:00:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021102549.411456-1-zhangfei.gao@oss.qualcomm.com> <cfad7934-2311-4f90-84f6-1f4f0fe585ac@oss.qualcomm.com>
In-Reply-To: <cfad7934-2311-4f90-84f6-1f4f0fe585ac@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:59:56 +0800
X-Gm-Features: AclHuK93uyU_SxCgBpB4-_dBDgLh4eV2_m8sdQ9jjZ4Hh87n-yd-DVVLCW3wDMQ
Message-ID: <CAFkd8hs4K+P=6oOjUc83hVKx-AWNn+kGbB3pWuXOTwgES+yRnQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: audioreach: support multichannel PCM formats
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzMSBTYWx0ZWRfX8SYsrJUMe2b6
 vEdfUktmeHKt9RspTnj9cFMo3VPHxx1HH2bZXrPP9I1oLA39Fv45OghDiwJ5153mywxi2YfT8Tc
 AsKjmvZ2VIrSmGMsprjsBGVk5gqxzoi76/IWLg+51WZcq5pl3Slr/XB/e7W+sk1/4M/uFEL2+E2
 rTjiRgA4qjDvwJf6xjmI3nU0clXXBJ6cCMzcAKzzHvHZa+NkxfhAM4s+t4qyBV9Gf3UyPm3ZYCA
 hvoTD7xZKimvBsRnsQZrAY3VlAgqP3la5ehG6PUiqZ746shpWcIKQoNYTeSuixL827cSLtvR6VX
 iuaO7HFOLkgjd+k85X1tie/hee/Q8lMVQreDvKUacaEjqIYIBUBeyw4XuQAemy4vgDvRHI36BYx
 wnl50i3lACjdpfAX1y0BA1PmjRsM1CafSf5UMcVzuu25C5XS7EzXobkmmi/WSkZ4v+4ng0qlPBD
 erCZ4IKaSxJBDXyI4jQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzMSBTYWx0ZWRfX3rSQEzb6SGPw
 NAWKeQvc3kUcG5NHCLSkRqiosXAJK7ILQlu6jSSx/Its65FkFD9nO52QmFK1XsJw4qhE1rNIj/t
 9grdthVbFeBZPBwuUWMqtlg3aTpqZzQ=
X-Proofpoint-ORIG-GUID: 0d4gGi9L6MnlEJ2ixB9LKT9deqJXFKS-
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adf0889 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=ftKU7t2rRAnlxZ0-E5sA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 0d4gGi9L6MnlEJ2ixB9LKT9deqJXFKS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260031

On Mon, Oct 26, 2026 at 2:19=E2=80=AFPM Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> wrote:
>
> >   void audioreach_set_default_channel_mapping(u8 *ch_map, int num_chann=
els)
> >   {
> > -     if (num_channels =3D=3D 1) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -     } else if (num_channels =3D=3D 2) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -             ch_map[1] =3D  PCM_CHANNEL_FR;
> > -     } else if (num_channels =3D=3D 4) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -             ch_map[1] =3D  PCM_CHANNEL_FR;
> > -             ch_map[2] =3D  PCM_CHANNEL_LS;
> > -             ch_map[3] =3D  PCM_CHANNEL_RS;
> > +     memset(ch_map, 0, AR_PCM_MAX_NUM_CHANNEL);
> > +
> > +     switch (num_channels) {
> > +     case 1:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             break;
> > +     case 2:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             break;
> > +     case 3:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_FC;
> > +             break;
> > +     case 4:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_LS;
> > +             ch_map[3] =3D PCM_CHANNEL_RS;
> > +             break;
> > +     case 5:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_FC;
> > +             ch_map[3] =3D PCM_CHANNEL_LS;
> > +             ch_map[4] =3D PCM_CHANNEL_RS;
> > +             break;
> > +     case 6:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_LFE;
> > +             ch_map[3] =3D PCM_CHANNEL_FC;
> > +             ch_map[4] =3D PCM_CHANNEL_LS;
> > +             ch_map[5] =3D PCM_CHANNEL_RS;
> > +             break;
> > +     case 7:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_LFE;
> > +             ch_map[3] =3D PCM_CHANNEL_FC;
> > +             ch_map[4] =3D PCM_CHANNEL_LS;
> > +             ch_map[5] =3D PCM_CHANNEL_RS;
> > +             ch_map[6] =3D PCM_CHANNEL_CS;
> > +             break;
> > +     case 8:
> > +             ch_map[0] =3D PCM_CHANNEL_FL;
> > +             ch_map[1] =3D PCM_CHANNEL_FR;
> > +             ch_map[2] =3D PCM_CHANNEL_LFE;
> > +             ch_map[3] =3D PCM_CHANNEL_FC;
> > +             ch_map[4] =3D PCM_CHANNEL_LS;
> > +             ch_map[5] =3D PCM_CHANNEL_RS;
> > +             ch_map[6] =3D PCM_CHANNEL_LB;
> > +             ch_map[7] =3D PCM_CHANNEL_RB;
> > +             break;
> >       }
> >   }
> >   EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
>
> audioreach_set_default_channel_mapping() silently leaves an all-zero chan=
nel map for unsupported channel counts.
> Since this helper is exported and callers such as q6apm_dai_prepare/q6dma=
_hw_params/q6hdmi_hw_params() don't validate the range.
>
> would it make sense to return -EINVAL for unsupported values and have cal=
lers propagate the error?

Thanks Prasad,

Then we can directly reuse q6dsp_map_channels to make it simpler.
Will update.

Thanks
