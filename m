Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522E8486423
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807803; cv=none; b=lsE25uthl9mnNpOFSygMHyrKE/ipfhvjtkRj/XfsDHwluY6DyFKQ61k+Jy5AeWona6fLG8p4Ed6gD77IKgpeb3OY++AWvMKycW2dHUVJSrjS2bKvtHIF6AGXITEGvxGJWf8UGi6tczk9IxEp9oeJn1RlvE3R1GC15c6NASNyuWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807803; c=relaxed/simple;
	bh=K/tySS7QYNRys93PcR8NTp1is92ZCxAeVbseXVxti5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tu0QDkDqv0HSKhaO5zejmDt09J4HzziwmcaykquNS4YjdojN0pVyKNRbASnTsdfo5iKHimOtJqYHnZzlV7bQoL8bz3QFgYWulsE3ZGBnxO2Lbpz8mH/fWHPSR/7xoRPA4VSJfFeojUJRN4vGTezQ06ms+SHnyh7h9EMNfC3e2KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfF2DObP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ab/hI4Y0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfF2DObP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ab/hI4Y0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxriF3363673
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Tl8k+BUtJHQINnzIvG/Hxt0
	atXp7wqqlJKLES8ZXeE=; b=bfF2DObP1GUQk3MjpGiaDuYbdQIZtU7V482r3uZf
	1rTwWpH862AfblPqofka9my1B311hvWsKg1IvCIwO0TBv6y+e7QMOqZxCnv8dJZX
	+MxS8v2qhBxszLRlKUw7m90iQXw88S9oOh9tfYFQHApFYfuxY0CHLWhkaqq5zYMr
	4Glea8rF6Nxkn38K9jl10RVrmlXHyU3J5kJGGunH7tJOY3Xf5SPYnvyfjBdGl+CL
	XI0V1E1TiiW6a4jsCA2WeKjubNAI7irfgSJYxLxjyisiNjDukiFVCjwm5Ee/USYH
	uM9A+q5x8EyBu0jAygtn4LcQeB1cvdjFc+inxAIsl4heuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr8p2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:23:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso364428585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807800; x=1792412600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Tl8k+BUtJHQINnzIvG/Hxt0atXp7wqqlJKLES8ZXeE=;
        b=Ab/hI4Y0dyzrx2JglVjpBroNvXUri3NL7mTRkHIhRPVZrFt3loV4v3xIDJnIKRy9wg
         UzqrnOFZ8CAg0grRtoarSuDXmV/yV6ZK22L3T+wxpMxAmkLKqDfU02tKlo7m5XAZ9BSM
         P0AKWZqRwDwQCTVjNxbw+IF4zKsDYgri68dP562h2WeHYOiL7kE9hzA4Io8fBQ4ZqEXS
         mpGqKBMIdFEdNAfBILLfJ8t0dCMfhpPOgSsvH1pT3xeltM8adGm613XfURyho8v36wP/
         w9W7LfmRFp/LgwChS/tp43LQciTSMeUfxjbcCXtkiZNXfwe5SYo7COIUd3joXd2TgudT
         LvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807800; x=1792412600;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Tl8k+BUtJHQINnzIvG/Hxt0atXp7wqqlJKLES8ZXeE=;
        b=vl9fGg/R2a7a7VSF02MFh/zLO1y/z+nFofyBNAKkS/O0U3OR6bh7vEj0N1SNpeqKmj
         b137psD0L2PCBvkRiarEdJ0hJUzraOBaxR97lPHEk6OLKLOoya3Lth0qJBmNXIT3LpBe
         GQCxbTcVryPZljIgVdR41KUPKbEH9NW6XemFZCnzjO3wz4jqLobpDo8eR4eIJNHmIGB+
         EBSQWT7hE1Tj0fsFoXGx5vtK1Anj3whgS2pk75TJq2W7OCj2Yy3ampgYcyw2cBpcU8py
         u37mz+3Mnqu1UEanKvp03BOEtb1B5J8aLxV+kBFQyOuTeP7xl7VC1NWwi85LsNguddRc
         tASA==
X-Forwarded-Encrypted: i=1; AKwUvBwjIsXtaSJivjGAaoGxr30gHJ1aiyTs8J13/kt4p3rNhmgwktS/Wydhr2CHryiOkre5wE05GpSZCWmrOJM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIc9h5u4G8pWsRwFdWH+yO5zMxOX5uPi8ZRoUbFoaH7yDriBRVS
	93fB54shB+yAr3xGx4lOF+0DS0jbe0i1P+2Y4X8NirEba8wnFfli3KOP5J4Xw0ZFx+cQLrhOyxf
	H4QuW7XpXAILNk4AKVnZvI11I2zVvq6n9apqQ2hQ5XGTC6Talt4yBrIVSlH5jKwFnQg8=
X-Gm-Gg: AYBFou0Yv3IWyYLBU87IurDT4FSh5s9w/2V/mOs42QYss3btDhjofiVI56WWpLKkBQb
	pVdMZrZym2P/yMv4PfZAc/9AIEtNQXUts4HDt3aVU4apknAPXUjYVDFLhEGpNdJzM8WP/lWKzOe
	LqwqEPwbymXcT+BQAPYXWfZIwrrVfNmPsuTnZ2xouAfdOA7Y3TBRmZK4epsZY5JAPGlqX01c2Xh
	3yTeP5tgYDWKeeIWJhjLOrqD5NpXCUtY7y15IeXl4DX9eaedE2Emk8Zx2KFGOT+r5YlntmfiGEr
	rhNP/qjnp3HA8CQIeWfAKbWA5AbxiM05RnzL5Mya1zhkxuM7EWg4/mLvRs/gPZjvzcXJrkjvlJ3
	7T18/f3odlX0BzWMsMwy/7VLysDcXjXT/pnK4XfeJoufMSMS9hJS5Xu14KjKD2MBEOlO0YXHvQi
	6JD8UMvaq0qCQG
X-Received: by 2002:a05:620a:44c3:b0:93b:d79e:18fb with SMTP id af79cd13be357-93ebd4a86b8mr1671170385a.62.1791807800339;
        Mon, 12 Oct 2026 05:23:20 -0700 (PDT)
X-Received: by 2002:a05:620a:44c3:b0:93b:d79e:18fb with SMTP id af79cd13be357-93ebd4a86b8mr1671165285a.62.1791807799753;
        Mon, 12 Oct 2026 05:23:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddeccd5esm2790210e87.82.2026.10.12.05.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:23:17 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:23:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v7 08/35] drm/msm/dp: add support to send ACT packets for
 MST
Message-ID: <fx5njelx53gciz6rguzjybxgbyxbfqweelsuy4j3aab2n5awrf@n27xvmre7ztu>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-8-4b81473185e7@oss.qualcomm.com>
 <aolbmfnrk6qkfifib6bmhslaro5z2734ydfip4mnn3go4efpsy@2d4m6nnh7ogv>
 <3c28f89e-8b49-4937-b4c8-66da180a5706@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c28f89e-8b49-4937-b4c8-66da180a5706@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX3DVOvjAv3tOs
 sv7EgRXAkxNGstN4NH6ybvj9zM+TslvOQTMcJtNFd6JHwGOIQ+7jXooAoCf52AzFG4rR6aVApC+
 XlY+uaZDMJMbRXCIOJ6csvUegfi3tFeMgpA0xjaTwoXAsclpMWIJtqdni7fVflbR5ivitZK5urM
 RdWbf3YotJHbGda6LKsvZVXM42X0PR1ZxjA+CutiRKKRXne01PdcdcKZm4FHpwM10NA36fOFPtP
 VWZ5Dmmwq+iRXgt34pIOfPhHL0QdlgzgARbefQjljGToI6gdBwUzMcVLRRvZllQ0ujZGu9Jv5eV
 TA5DQ6/p05wPosS2w7G/PIHQDchEyjtGhasqLOpkSWPpET6Fo9nLqytb6R7L+MxrnmGEYXRuhWi
 MEKWFsZJ5K1dpfnKmcdSFzUSra3SAUCHfshsjo05OzANRQs63MIo9oD2d72LG6NpVrZW0Zg2RET
 S+pAvD7OrorCQYqzMFA==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6accd139 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=ecUC0MPj5Ne1r6wDHHIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX4PitOkfapVda
 tWhfzI/n0U3rXJH05RW3DEsuAtHfv/S5MZCWHRwegKrc5Qlw/6GOFAjnccY51A9lEluvvJm0wuT
 UN9skNW3AhfHZsrlZk3oQu03YmQBmJQ=
X-Proofpoint-ORIG-GUID: spJntitKXGL8-UoMtWCdVA-57wQVINET
X-Proofpoint-GUID: spJntitKXGL8-UoMtWCdVA-57wQVINET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049

On Mon, Oct 12, 2026 at 04:44:06PM +0800, Yongxing Mou wrote:
> 
> 
> On 10/1/2026 6:32 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 29, 2026 at 12:25:32PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Whenever virtual channel slot allocation changes, the DP
> > > source must send the action control trigger sequence to notify
> > > the sink about the same. This would be applicable during the
> > > start and stop of the pixel stream. Add the infrastructure
> > > to be able to send ACT packets for the DP controller when
> > > operating in MST mode.
> > > 
> > > Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
> > >   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
> > >   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> > >   drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
> > >   5 files changed, 51 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > index e1614bc49a7c..65d22505c2b6 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > @@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
> > >   	bool core_clks_on;
> > >   	bool link_clks_on;
> > >   	bool stream_clks_on[DP_STREAM_MAX];
> > > +	bool mst_active;
> > 
> > I really don't like the idea of having this flag in two locations. Here
> > and in the msm_dp_display_private. Can we have it in one place only?
> > 
> These two fields are intended to represent different states with different
> lifetimes.
> 
> msm_dp::mst_active tracks whether the DP connection has an active MST
> session. The controller field records whether the current controller/link is
> operating in MST mode and remains valid until the link is shut down.
> 
> I agree that using mst_active for both fields makes them look like
> duplicated state. I propose renaming the controller field to mst_mode while
> keeping the display-side field as mst_active.
> 
> Would you agree with this change?

What is the difference between these two? I.e. what os the difference
between those two?

> > >   };
> > 
> > [...]
> > 
> > >   static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> > > index 83117e7619f3..472429d09200 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> > > @@ -19,6 +19,7 @@ struct msm_dp {
> > >   	struct drm_bridge *bridge;
> > >   	bool audio_enabled;
> > >   	bool power_on;
> > > +	bool mst_active;
> > >   	unsigned int connector_type;
> > >   	bool is_edp;
> > 
> 

-- 
With best wishes
Dmitry
