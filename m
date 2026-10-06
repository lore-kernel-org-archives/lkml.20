Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1861F192E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791256117; cv=none; b=pc6w1pbhxBdZGmlbPSIXgG79vzqAgm9EIZBTz5yGZof4YVBWNA4lJD4uqc2DjNCRctqnNOOw1StYV0p8wwFD8oGgURQDt79IhDCEj4hQyynQ5yzliBRMKdcVidrcxwtKe+9tQRD6ARz0ZLz6G6us0Ni2KXWgKSiehjuRa4HkwnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791256117; c=relaxed/simple;
	bh=nBRknMvp/qTNuVm62oufluoMWsTYDX7C0OSSltsXjvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTf/kbt2FDTJd+LG6Yt4yARsQjqU7ziMSIRP5UTuPhwgw7qj3pKElZL169ZjENNw6SflHmpf8BoLgzhi9HC5lIPlMu8ggsfNiGpnliLnciEAmTVVmPdF6VX5JYo2yOsUPGruVxN0545GtIKKgG58LF0XgjIV2HUd+2kglt8onE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A1TB16Ni; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkIG3g/F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1TB16Ni";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkIG3g/F"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KN0m11535979
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 03:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b9GJxTnefnG6SBogmC9aNsTp
	ymUfHN5wS5x8XoHtG20=; b=A1TB16Niy3/KOOj9OmN+GZJ3TzPDjgCdoeItkW8N
	s+PZ2C/8PGoMk65NHcuc5Tuw+Ae9Etvc+HTbhKCml9eBT8o1279s43xc2jvx20tN
	jenE/bt6ess+GfFNUuB5SVC6s7xcJss6/hUxEG26VnN6k4DDBpGxeVu6UBHZ0pwR
	z/TLnKXz0MZp6eC3HUFP92VcbkdZ85wg4UL3WzM4LwRaMQi+5YBGINjWgBXiiArs
	eVI78ER8ryeK1MS2xY87bCZkq706J3KamKDEjUwTDnwWOhzvw55Sqa6ZpVpZRrVL
	aTrtc6yL+TFbKaYX9ZptuaNmXf5u10Qr73Se6a+2l4E63Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dncjhr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:08:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d49d8dee1so35009eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 20:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791256115; x=1791860915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b9GJxTnefnG6SBogmC9aNsTpymUfHN5wS5x8XoHtG20=;
        b=DkIG3g/FKl4hoAzbrwQGYDHaBO238ZnBq4iF4gem8nQEsQbmU8Rv4EjvhTAs1C+7Mz
         BPMmcLURcQ/AvGelzuA3auhbiAYzRJsinnYMDMjlVaWUUCzCoAO180iOxbe39UVldhSc
         ybtNXT0D1nRjei9gdyvjYOEDhXPOxyair0sqI1FRK8mLa83epbai0m52+cFXguRu2C1X
         F5Gz+YfGUQdp8cE8Scjd2+gZEgcEsCkL8PL2H2fiXc71VMPnffxjmdFQsBOtJ1Fr8oHD
         oJr+kNJ8MOhI1HXXev0cbsa4mq6w58L6XPKWR+RH56MugXD4+NpzzjNV0YFwPcuHzNA/
         52Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791256115; x=1791860915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b9GJxTnefnG6SBogmC9aNsTpymUfHN5wS5x8XoHtG20=;
        b=01LHJsn/12TcNhtQiMeJMiB31kd4o+aA7D+75Z43P5Pxnz9psKi6cAeTTOtP0l+H8/
         TWRcdJE9BPcmqh6Q/Jc40ikQ6U/Db9dal0AvdId3NAYnXBvW3qDClSpfVe7Ihr7xdG97
         q24xMFhhlMhHPPhF5Wkyu/Y9HajFthifLg3N0pKomqkpjiKTMRDjovY6/GrVqk7fqlee
         DMg3WxtHKLepIbKaUnPbwTtkFuf2CLo1486qCIzsMk1cESNkaIK7sytPFVOSB2SGj6o2
         Hh63mecFLesZh+rCCFc3h6ukQAkLGenW28IvLhwS5mCAW1MHHih+aA3UMIy/JENHAhhe
         wMoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFxCxe8raKudYydqNyahDeUomYuqs5+ijxxo1sIL7m4j+Q7dFVwd8AncXkvrgESz0NWDLJhb/BBxRVdtI=@vger.kernel.org
X-Gm-Message-State: AFuF++nDj2oUU7QR5eB1IecNlwk1fpPPmt8jFG00c+uuWIWmzidbUkR0
	T1BMVgNRbOCOX6dEF5j0vpIdyPABZ+nSoNwfbPioDG2g6V07xlaJuga6+nOkYvBN3Vkznd2TQhT
	3Kxz46dT6JITZI83ba77hPcOGYbIZzAzeSRsv9aleRnDqm/z0QnXFbNBmtJcPLLKH2Wc=
X-Gm-Gg: AYBFou2soJKnVNB78Sfn9yZNRyNDLCYbo/PqTr18BICu3yAy4OBRFh68GiUSw+fuOpR
	UnNifVi4rlwopnSanTo6h0v/J+u1Fr6GNW6Ht3gUUFgb3NwmEUbBTgT0h365ogDN/n/NS/GqS4J
	FJAskK/O9/dH095ARVQEN9SCTsQJ00mAotI/SEc2S1WgrWq4GJipqD6fCWGLXMgu5FEpxi9FBTZ
	E2N93E9mbgnaJDd2uAfoyQ29RXjZWlrjYeBLMFZA6LSZIjhGGyE8AtmUktypjEyeE1mLsf+bXsj
	NFvcWyB2sxeqEHCTdtxdtPzI7o9jnNPXUhiMhsX20dTbuHJFR25UDssrLXDiGGuS0klvu8PidjY
	DDjmpVeYLFR+ufO9TQcsPO2mIZ60izP4H0oBRTzJrrg==
X-Received: by 2002:a05:7300:d0af:b0:351:4b50:4063 with SMTP id 5a478bee46e88-3514b50411fmr429747eec.37.1791256114568;
        Mon, 05 Oct 2026 20:08:34 -0700 (PDT)
X-Received: by 2002:a05:7300:d0af:b0:351:4b50:4063 with SMTP id 5a478bee46e88-3514b50411fmr429714eec.37.1791256113832;
        Mon, 05 Oct 2026 20:08:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146b17351sm3209417eec.26.2026.10.05.20.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 20:08:33 -0700 (PDT)
Date: Tue, 6 Oct 2026 11:08:28 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Drop early_boot flag for Nord
 ADSP
Message-ID: <asRmLCHCpjZi2jEm@QCOM-aGQu4IUr3Y>
References: <20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com>
 <58c1c4a9-afad-4059-ba81-cdcc92d0c5dd@oss.qualcomm.com>
 <asJwJ6cq8FcA0IID@QCOM-aGQu4IUr3Y>
 <asNS2MeAkLDKM0Lz@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asNS2MeAkLDKM0Lz@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAxMiBTYWx0ZWRfX1Qj/xdbmuc67
 6PRJfTghQ9gEVcZFjCvLl1GEcgRh0R1esX2vSt0Aw4SxTl5YjKqKPteQuNPoKhP/js63rAfLdS6
 OPirSua+isZ+ow2mBpme/w6ZO+5Oh8E=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac46633 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=gy8nA2QsW2tLNO0zb2sA:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: BUY_PHmpbhfuVv4dQOin1fbCAQKWCWQD
X-Proofpoint-ORIG-GUID: BUY_PHmpbhfuVv4dQOin1fbCAQKWCWQD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAxMiBTYWx0ZWRfX+gF6DksdOTlY
 7XfyHzCsUn4hoqyyX3x3RtzKIiw1pUq9VgeAfVSvXrb8i3PGEskeE1/AQtGs5iMR65IUL8nK3BR
 zQx13yo/s36hgfJW+KPCKhl77QBDVNZIAuIx5YKIcMsVxhfevsuXaNNPUuD0bc9543w0RttdAGK
 wlmhO9uOYeJanqXpQVbwuG/aFgxNk73Ya5F64e4BlLlNE2SdGl+DQtW2/qtaBZlI6SEDnmYh1vR
 XF2TczhQZq7KhkLQNxOrzfaE1dFJPLpVtZW1HxsV8XFXNKNVl5mAYquoH2Ez6JARHV+uY+Pvil1
 2d/bJMbtJK3xtySuwRy4vsgh2WVoskjWdrWlnr/Oa+yaqNWAG/NMdlGGVe9n6wnns/9V+34QZnd
 Kk8lnIDXEjTZHkaRTVVMDLRBw4Uxxshpw2WkVXID/fRXviw6MVERrPt1e3bWg3UAQu+LKBXJbI3
 6Po+o+HZcqxOVAuIapg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060012

On Mon, Oct 05, 2026 at 09:34:03AM +0200, Stephan Gerhold wrote:
> On Sun, Oct 04, 2026 at 11:26:31PM +0800, Shawn Guo wrote:
> > On Thu, Oct 01, 2026 at 10:42:39AM +0200, Konrad Dybcio wrote:
> > > On 9/30/26 4:07 AM, Shawn Guo wrote:
> > > > Qualcomm NHLOS team changes XBL for Nord IOT/Embedded variant, leaving
> > > > ADSP to be powered up by Linux remoteproc, so that Nord IQ10 Qualcomm
> > > > Linux (QLI) behavior gets aligned with IQ8/9. Drop early_boot flag from
> > > > Nord ADSP for that purpose.
> > > > 
> > > > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > > > ---
> > > 
> > > What happens if this patch is absent?
> > 
> > ADSP never comes up:
> > 
> >   remoteproc remoteproc0: attaching to adsp
> >   remoteproc remoteproc0: can't attach to rproc adsp: -19
> > 
> > Since XBL no longer boots ADSP, the remote never publishes its SMP2P
> > inbound item. The smp2p entry stays unmapped, and irq_get_irqchip_state()
> > on fatal_irq returns -ENODEV. qcom_pas_attach() treats that as a hard
> > error rather than falling back to a firmware boot.
> > 
> > Even the existing fallback (ready bit clear -> RPROC_OFFLINE) doesn't
> > work: rproc_boot() takes the attach branch, sees the error and returns
> > without loading firmware.
> > 
> > > 
> > > When the early_boot path was first introduced I was really hoping
> > > that this behavior could be made unconditional and Linux would
> > > figure out if the rproc may be active by virtue of it sending
> > > back signals or not, unfortunately that hasn't made it into the
> > > tree..
> > 
> > The difficulty is with the positive signal. As Stephan pointed out [1],
> > the ready bit is not cleared when the remote is stopped or force-shutdown,
> > so a stop followed by rmmod/modprobe of qcom_q6v5_pas makes the driver
> > attach to a remote that is not running. Without ping-pong or a PAS query
> > for the remote state, I don't think we can reliably say that a remote
> > *is* running.
> > 
> > The negative signal is reliable though. The -ENODEV from
> > irq_get_irqchip_state() means the remote has never populated its SMP2P
> > entry since cold boot, so it cannot be running. We can fall back to a
> > firmware boot in that case. early_boot then becomes a hint that the
> > bootloader *may* have started the remote, which matches Nord ADSP:
> > it is started by XBL on the Auto variant and by Linux remoteproc on
> > the IoT variant.
> > 
> > I'll drop this patch and send two patches instead:
> > 
> > - remoteproc: core: continue to the firmware boot path when .attach()
> >   leaves the rproc in RPROC_OFFLINE
> 
> I don't think you need this change in the remoteproc core. In the
> current upstream state - without the ping-pong implementation - the
> stop/shutdown/ready detection should remain static during the
> initialization of qcom_q6v5_pas. The boot firmware has either started
> it, stopped it, or never started it at all. Those signals should not
> change state until we take some action.
> 
> IMO the proper solution is to move the checks inside qcom_pas_attach()
> to the probe function and never mark the remoteproc as RPROC_DETACHED in
> the first place if we already know it was not started.
> 
> The fatal/crash IRQ checks can probably remain inside qcom_pas_attach(),
> I would assume the remoteproc core does not handle the case where a
> remoteproc appears immediately in RPROC_CRASHED state.

Great input, Stephan! I agree it's way better and cleaner to fix
the problem by not touching remoteproc core.

> BTW the issue you are running into was pointed out by Sashiko during the
> review of the original patch, see the second comment here:
> https://sashiko.dev/#/patchset/20260623-knp-soccp-v7-5-1ec7bb5c9fec%40oss.qualcomm.com?part=5

Ah, it seems we should take Sashiko more seriously!

> The first comment from Sashiko about the broken crash handling during
> attach could also still be valid. I pointed out the same problem
> multiple times during the review process [1]. Unfortunately, Jingyi
> never fully addressed it. Eventually, the fixes were moved out into a
> separate series [2] and AFAICT abandoned as soon as the main series was
> merged with all the open problems. I'm quite frustrated about how the
> review process went for this change. :(
> 
> The crash handling may have improved a bit with the fixes Bjorn did
> recently [3], but someone with access to the hardware for testing should
> really go complete the work that should have been done before merging
> the original series and test that *all* the error cases are handled
> correctly (remoteproc running, not running, crashed).

The crash handling seems still buggy, even with Bjorn's fixes.

If attach finds the fatal bit set, it queues the crash work and returns
-EINVAL. The core unwinds the attach before the crash handler can take
rproc->lock. When the handler runs, it finds DETACHED, sets CRASHED
and calls rproc_boot_recovery() on top of a half-torn-down state:

- rproc_boot() has already dropped power back to 0, so after recovery
  the rproc is RUNNING with power == 0;
- the subdevices are unprepared twice, once in the attach error path
  and again in rproc_stop(), so SSR/sysmon notifiers see a duplicate
  shutdown;
- qcom_pas_stop() and rproc_start() run on resources that rproc_attach()
  already released. With has_iommu, that means iommu_unmap() on a disabled
  domain.

I reproduced this on Nord ADSP by forcing crash_state in
qcom_pas_attach(). Recovery itself appears to succeed. But a later sysfs
"stop" takes power to -1 and returns success without stopping anything,
and the state stays "running". A following "start" then boots the firmware
again on top of the running remote:

  sysfs: cannot create duplicate filename '.../qcom_common.pd-mapper.0'
  remoteproc remoteproc0: failed to prepare subdevices for adsp: -17
  remoteproc remoteproc0: Boot failed: -17

> In other words, if you could also do some more testing for the "crashed"
> case while fixing the "not running" case that would be much appreciated!
> 
> With the state of LLMs today, all the discussions and my lengthy
> comments on the original series are probably perfect as verbatim input
> context for an LLM to make it do the dirty work... :-)

Indeed! I will try to fix the crash handling with LLM's help.

> [1]: https://lore.kernel.org/r/aUsUhX8Km275qonq@linaro.org/
> [2]: https://lore.kernel.org/r/20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com/
> [3]: https://lore.kernel.org/r/20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com/

Thanks much for the detailed pointers to the earlier threads!

Shawn
