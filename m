Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4BE4E77F9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791564022; cv=pass; b=QpaLI21kVa2Z7U2Kz943cvaHe5Rq4gAOfjewA9kXnKJRr4Xie/1BXpYEJB1v2RAjnU90rW0Lv1xIRvjU/nJImW5d22t6mGPWdIkbZCQt8gr/Lv7j1f4lh0nJmQAYjtU88Acrdq8JMDNVV6MJdMQxb30v5jrkQk1IRermqM1YEmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791564022; c=relaxed/simple;
	bh=O8BZgU9vbT9VzKGigoj0YhIQo4ixHDL264tHQrF7gDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDSZdAJXHQbUxJsE/GDhG46cCLojB3+ACt7MRgqkFRH74EEfSYSejVevpFXC6TSo65JwxulG29qgfcgOy96jA0xJsIjaedYkxBGjRInuj46dRs5GF6ExLkNJAPQVpS69LZMAgQjoYmj9U6AtSbRNK+CyKcTGFWuuBy0C98PfVXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzVoZ3gE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBs2swyv; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzVoZ3gE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBs2swyv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699GbDvj1493152
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 16:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	03cV0/SHCir8TBf41ccHk0p543FbvOFeT/DumSE7PMQ=; b=BzVoZ3gENy1gF6ye
	qYehjQ26tYEkKPZmjWraQwf4erIChnc9V+zoKmw5bLBu/exRPi7Q4fQrYx3ftdoI
	K41uJG5h4TUThUzDcLqOKWXAZRWXwdyxHqyKdtPeGgIVQxaUQwckq2o981X/uk2P
	QMvc/NRZdN2sNRQIqMu8j4KW6cwuGjwHBGdUi9xWWEK47GmlC/04OS94KmujDl68
	iH6EB+Ce1KfP0MgEASzew9nXIUkc2wFJsB/uRNB50GfOwmEsXqfgSgZ4/uku8L/w
	x3X6Yb+LnS4+2cNJR5+V/SpJgJwA4Wlr/PtgkwG7jY4hYmBeF3Rc2nYg0s4dRhAk
	35WfOQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h73kgg3r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 16:40:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso1288184285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791564019; cv=none;
        d=google.com; s=arc-20260327;
        b=lKrSFS8Mt21t+Yde0th6eHhUFwJu+1iALzSoTwgT+VyVKF2zMaSNVDenLiYrm8pTmV
         Z4PjiVAECYOK8ezl6IC05oz5giwfEqNw3xDkcCN1Te+YAkjCNpcGxdo5PKfoUMjCwfXB
         1M493hcdNdeshZUvu3LCExpbzT1FZExRFkZeNgKxF6BZmu/K9OJYF9jQHgZwGfQ449VF
         8Ih02JB7KCR0ogHE1UEkn+s6SsOQ5RQWGSXHGw6u7ibWpSYEZlMOPkWr4LemxYt3jFCn
         EoybbWWoXW2HEiBIPoeDBtdF/mGEe00fpNabP9TA0M+89etqV/G6tubVS9HaVupwL8OA
         yEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=03cV0/SHCir8TBf41ccHk0p543FbvOFeT/DumSE7PMQ=;
        fh=T7pGHEyGma5tILoom8mCkPdl+Jf1PHmD54p0irwrmGU=;
        b=Id91CZECNjNWFSXiIls8iIZGO3ozr4qhuTbGHLrdWv5tvXN5drhA//xKG9XJ40xCdp
         P0drvtDBRqOenw9vf4Uju1cNdrOIC9gdOeF9lGMCj1jcZaC6mzRJ5tPZDUXZIWg9gDTl
         ps9AbtGSl2OnWf5S1F1fdwYlvxxvhBVmz3td+ZdUsnTl2ALuB8YYOOPh+yGIdP7HosJf
         H99003Lw9tGtYfgGv5weXy3zfZAIJV7hRl9SCeFFQMZu+MmeWmWP7T5MfF+q1cI9owvN
         KMcRnrqbLlDxNYe2PZbSepwxsY3z9sn3urK4z4FYYpdg4B22Trvg/4ZJYanCLa5YB5NE
         i4bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791564019; x=1792168819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=03cV0/SHCir8TBf41ccHk0p543FbvOFeT/DumSE7PMQ=;
        b=fBs2swyvZBOfk2KVO5FEc04xYgLuhAZMmXCuuPsSJu9J0LoO1mXm+ZSW/ovI6u/zmD
         NeHYZrYGip/ndFzhL3P7Wh1nTOAjaRQ/aYrzrMpUBQMmHJYdekLLzFBkUQz1YO20dyLR
         ACK2jkA1gg8UJc1d0JFdFAKSYHui4ICO4aHWYjcqdvr35QdJlCji6o94e/Dl0oBizIeu
         2uJYW2swCJcxv4o+fi+prOewV1nTP/ErPYml8l26JmmvKLoTyhHmblZXuIMeDaRF+Aw+
         4wTM1HxkgegNyl7wZF5hU+0xHPKINBQr966bKVbFCD1M7tTfWIykR1iKPW8tjczMgdpF
         s+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791564019; x=1792168819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03cV0/SHCir8TBf41ccHk0p543FbvOFeT/DumSE7PMQ=;
        b=H1STs+DJH6R7Uw2SrYgLhVi6aFuKDBnB6zpYIOPpA1WgMsi6H7DnOMFXI7BmMcl1Fc
         ACkelWlMpUR9xodnKB1eROxXrYQur5dfLzNaPdcoCWC8+H0hHiw1R21DpXZsEWVzuzVy
         Nvh3LZ9gIJCZDVNgBvGCNKTO7PSwvnFN/rPSmJDkNXL2rGJKJceE5BZFUHNYcFHFFQ78
         fRLnAhdDv2bXHyYvdPPMjsDn4MwoSur9z++skpqMek5HgdoYb25P4+iP3Vf2uERo3q47
         UuptO3j3KpPlsXra7vWOO9MCUPMt5R532JARlcYugrNC5eBN1LWSDl7gSs2Nz2YFgNia
         Scrw==
X-Forwarded-Encrypted: i=1; AKwUvByVuUYM016UrKGW4Op7uJ2Ue+XgCUKYKWfaYrVD0Vx7E/v9O2G1Hr9WzZ/FKJA3RIQGF5obtlFm+S1jE4o=@vger.kernel.org
X-Gm-Message-State: AFuF++mK2ANuf1SgmyK/e5U9YG2qO3ZqtE8g1o+75AnBlt2+hxgF6JBK
	jnUAn9pRtsqRPUI/2NNcFC/d8lA2xwZ2091GgmDKWmgQlX0f4V57lfWiXhly7lxME3RCGsBtVMH
	taol8vtM32FCHMfUq/DJ2ZUm2ZxEb8Xti1BDaleg0R5PCtxFepXrbujJthg6dNxygBxU/0v4BDP
	xAHaR+fKbLz37lpCMe14+GZaKm5Y8qYY/VMnmluZO2pg==
X-Gm-Gg: AYBFou1YoXomxk0snDp0jFkjjMOlaw+F0rFxNlA753qcN/hfoFtzmGWsqaCspoSyjff
	LAU32IExv0rq/ktJ/Uhx9hozpJHssxNKkxg4cRIAdS7x95vEQ/p9ryBoQtzNktaJFqpa1uppxSR
	vR1mFGRGQU+AQgI0aevrnxztCtIgOKXtVmTHH+FqfUXzub1xi1bhyee0hPSrcmcA3cVJsElkB2Z
	cpKS7pagDWBI/GZhub/uEYuT6FieREYowbOBkl2IvxUCWGViFVZUqUclQd/Mq22jZkalzYiPQqJ
X-Received: by 2002:a05:620a:269a:b0:939:13a7:70f0 with SMTP id af79cd13be357-93ebd0c260amr388806785a.5.1791564018726;
        Fri, 09 Oct 2026 09:40:18 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:939:13a7:70f0 with SMTP id
 af79cd13be357-93ebd0c260amr388800385a.5.1791564018141; Fri, 09 Oct 2026
 09:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
 <20261005-monza-wireless-v7-5-5a6de7662dcb@oss.qualcomm.com> <bc7730e4-8b47-4c2b-84ef-277749f2aab8@packett.cool>
In-Reply-To: <bc7730e4-8b47-4c2b-84ef-277749f2aab8@packett.cool>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 18:40:06 +0200
X-Gm-Features: AclHuK9ldJgKtc_xURMW1e6eF51wDo8WFdbnPxmGKItG6GLqTwM1Bp8vW5CtXNc
Message-ID: <CAFEp6-3Mt-CCJEz=RAJUh6pxH-Ssgkqfx3QQfyzvS9HwzFp9QQ@mail.gmail.com>
Subject: Re: [PATCH v7 5/8] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
To: Val Packett <val@packett.cool>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA2NiBTYWx0ZWRfXxyFp4qWgUpBB
 oy6upNgkyomvgEVM6s7cqujJRtekkTvNDzS/1O8/BVCKd9IzM+vaejpxhcbd0euMAJCCQNRp8Gs
 M2Pmpxf6CE9B3jW68XQlwIt+/GTbaRfkUKm6dEsjY+aeGooEUQ5+VvqaL/8ZojN7Wu7o3B+zqaD
 KaqejS90J45IGP3cWusA69Zd3r2uRN5CcPUbbQWCvltc/lqw2SY778Qnt0S5DZjK4GzpVZVAvUJ
 +vtTnsWPZbwRQgXZ4wrQE09mOhFqYTDzBOzKcZ7QqYvupgIMHFaQ7g9i55+7R2svIzvIcmJS/ee
 p1dGRAkdOzeTLit41n8sm+wLArWo9poj3ErR5UPeMFZSAiWGAB94KKHHp5RPC1yljDvx6fjxgNd
 +3yJG3VmeSizS8/cvTJIkI0cu/nPJ45OzbQ63Do+G3sTRIBEVCZTFmZYJSxlAlPf+iKRPOjUvzm
 Faf03P+kQ+xfEjDGaFQ==
X-Authority-Analysis: v=2.4 cv=RfYFmFtv c=1 sm=1 tr=0 ts=6ac918f3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Zz9X-WFLHu0qX2yPYA4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: dGBd5TzqbuXU1FmUH9whboFP3UOhbqBy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA2NiBTYWx0ZWRfX3V5pjq1xt1hU
 qX3CfJgdNQKsaurRs/K6iEpw0411iaDSMSM8vnMpGWuZCXa//6+2+0FBiEPpdutiwZcaWOwN8sj
 EGo9/Xb/CSQ5tLG0W50DDlMjgw8ylzk=
X-Proofpoint-GUID: dGBd5TzqbuXU1FmUH9whboFP3UOhbqBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090066

Hi Val,

On Thu, Oct 8, 2026 at 12:58=E2=80=AFAM Val Packett <val@packett.cool> wrot=
e:
>
>
> On 10/5/26 9:21 AM, Loic Poulain wrote:
> > For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable is
> > controlled by the W_DISABLE2# signal managed by the pcie-m2 power seque=
ncer
> > rather than a dedicated BT enable GPIO.
> >
> > When the serdev controller has an OF graph (indicating it is connected =
to
> > an M.2 connector), acquire the 'uart' pwrseq target from the connector'=
s
> > power sequencer and use it to control BT power instead of the bt-enable
> > GPIO. This is factored out into qca_serdev_get_m2_pwrseq().
> >
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   drivers/bluetooth/hci_qca.c | 47 +++++++++++++++++++++++++++++++++++-=
---------
> >   1 file changed, 37 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > index 1d27ff98034ba99d0783e48db5c605f3b31117ea..b6ec1a57248e2cf4bd13889=
8ffc5cad45b1b4a8b 100644
> > --- a/drivers/bluetooth/hci_qca.c
> > +++ b/drivers/bluetooth/hci_qca.c
> > @@ -1875,6 +1875,9 @@ static int qca_power_on(struct hci_dev *hdev)
> >                       /* Controller needs time to bootup. */
> >                       msleep(150);
> >               }
> > +
> > +             if (qcadev->bt_power.pwrseq)
> > +                     pwrseq_power_on(qcadev->bt_power.pwrseq);
> >       }
> >
> >       clear_bit(QCA_BT_OFF, &qca->flags);
> > @@ -2396,6 +2399,34 @@ static int qca_init_regulators(struct qca_power =
*qca,
> >       return 0;
> >   }
> >
> > +static void qca_serdev_put_pwrseq(void *data)
> > +{
> > +     pwrseq_put(data);
> > +}
> > +
> > +static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
> > +{
> > +     struct serdev_device *serdev =3D qcadev->serdev_hu.serdev;
> > +     struct pwrseq_desc *pwrseq;
> > +
> > +     if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
> > +             return 0;
> Seems like of_graph_is_present does *not* return false for the existing
> (non-connector) setup which is currently used in all the laptop device
> trees..

If I understand the issue correctly, this can only occur when a UART
'port' is left unconnected, in which case the failure is legitimate.
The laptop device trees should be fixed accordingly, either by
connecting the port to the corresponding M.2 device or by using the
usual Bluetooth UART child-node approach. I don't see this issue in
mainline.

Regards,
Loic


> > +
> > +     /* The pwrseq is looked up on the serdev controller (which holds =
the
> > +      * OF graph to the M.2 connector), but its lifetime must follow t=
his
> > +      * serdev consumer device, not the controller. So acquire it with=
 the
> > +      * non-devres pwrseq_get() and release it via a devres action bou=
nd to
> > +      * &serdev->dev instead of using devm_pwrseq_get(&serdev->ctrl->d=
ev).
> > +      */
> > +     pwrseq =3D pwrseq_get(&serdev->ctrl->dev, "uart");
> > +     if (IS_ERR(pwrseq))
> > +             return PTR_ERR(pwrseq);
> > [..]
>
> So this returns EPROBE_DEFER and bluetooth gets deferred forever :(
>
> ~val
>
