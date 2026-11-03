Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698953;
	b=Y0/8rRtCeRr/K49M5qkOCCNF9gL7BuEK1n8gy0bsKQCE6mEcMeqv1kcRMnmuYRCYy3KM
	 T3KFQ5mXnUy+V3so6COeqEFcDCbR2tO/M8vBlRDUz2ZGMxY9VpItI7a3s0UMypgn69K4g
	 PseGiGodVC83RJ9DoX0lkz2u4AhjEzVJyQciwV/9KhIcI7/EA/bHykQ8Hg71psN2UoDAO
	 Wwhgfjyijsm8ubEQgJ5ZiMX6IIn9EKdJm3RRBteD+jeQuECrZvm5/lNlcUekJtv63b+kt
	 BR/DvAZhWL4ifdUXBeUkZpJXKlHwndQNrBQsi9f8mZah6MHKroX8bjsXnlk+gdeY/aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dQ3IlFmsPSWggRQ/22Hknd+F71Cojm8gDMGFW3Wmerk=;
	b=TYKKKhNQgDoW8vOaTMeLH5a6I75FYG7tTfHiDbFpBEjqbQjuwoZfm3TsaqcglcdTZPoL
	 8QF2Gaakjat+fCtDopOzakl1lI9QANmWbDpA4ei2OV9qtou6deHn1NilIqoJ0VBmFzW2n
	 By1PvCy65+aIYQ4yyL/+qUtaq24PX9z2Yxl23jnM2Bu5ir1k0ilRyqBYzYhFdHFi1LxGu
	 xqDcO9wi8HjG/4ZaiDZIyZ0FzDJY+ytxktCUTF+kWUvSqgGptLrb682pQgJOupRLwwsmm
	 +OFpMtZYqdrCUbUi311Wiff7KHD8VV/8HutHqVnexitNc6NmE/uIT2w6LgKGO0YdSbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a782sjAF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U8ufsOlY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD501606D820
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD501606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a782sjAF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U8ufsOlY
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37qJjf1397438
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQ3IlFmsPSWggRQ/22Hknd+F71Cojm8gDMGFW3Wmerk=; b=a782sjAFS4L1j+hu
	Z1tVUHZeSvfCskxsoiPmCFruD5xEsPWq6LKxMLkLcPk0YSUnlRwgQ2ZfxWN6P0S+
	BiHYhaT6ThKsOuDedIXFH6A9yYBKCH7mVRdaZz7ercDo3ayCyZV91j7iQNK5FVFn
	6Sz6njBwkw3ghKLIcGOKAOmXl4PGbjfRp5vTvZTlidGZ144O7F+Dm4DNW7LGwyC3
	li2AFpo6Z9IbOOi4kPW02sl6SHOLkgrbfVABAhEdeixFzFKjb0Lqnffv3f+HtHTc
	fBZa00qqp845F27Yts6nMDaVl4uvGe3SbFPs87wFZ5y16pdSaB/g7RqVhHzjKHWb
	ocVQDQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5j0gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:42:32 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf586522d4so2883402137.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793698951; x=1794303751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQ3IlFmsPSWggRQ/22Hknd+F71Cojm8gDMGFW3Wmerk=;
        b=U8ufsOlYO0BQZUDrBNzSIZ2hEkTT3JvSQCGpK596x/fAij07xD9IBmJpfz3Viszxow
         WMfIsUOA9q/jlLwxT1CBDrPIi6AYcHagBPDhTDOQIzVdQ6/ZSpCONuTyu49v3RuCwfQo
         4ZmD3UmlvOPZzg7gXrVstY/o8KR+YgHPqPWMd9qswSSfCJOyjJlIUZsh4r6RHZQwRFX6
         lo9Hqod+kdefMYcm5GJLsAtzKyDJS8dSgCgxqmH49Zwsnfr80xfByevDFDSLoWuTSnXK
         /uTyMrlQpu+zcAfR5WrY4fkYWbfHxYeoQ1gfaZpYcE9ucW2pt0bnC7CeVaBR2gIiPHVw
         Lf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698951; x=1794303751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQ3IlFmsPSWggRQ/22Hknd+F71Cojm8gDMGFW3Wmerk=;
        b=oR7hCyj3+TD3Byg1HhHDSJkiD8Kru+zXUHNkEPMKm76c3IoXUQuiInh9UsVfjVFnsn
         y/q6ULeGyOdi89w7hzRNMf5VvtfYU2JkU4KbhjvLPFHM193gd0By41GgPw0SO0diVdyx
         ocIEdDdwvM78kZkGDVxktQ70UXKbD9WHY+85vxDXH2LRH7Z98F7LrsGw7l6fVKTwcj2y
         oK92EFE/MHMQr2ZOAxY+x8bHlnkPer0sDONGEpP6BM5GXtqGKJRZMKcAx0twpjTsTrCZ
         qtgnaezLfIX7jXy08BDuNFPUTAgQUSsLta5A2bkbCBgzF41YsRg9DyQJnANuBcPhnR7K
         B8iw==
X-Forwarded-Encrypted: i=1; AKwUvBylPL108wdFh3IFZ3CWDYp2WQ2arnqmnudJyUXPRAC2SJ9vePj+JHC6hjS4kb5GyzeIzUdtUASozKjAsdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d2gAPfxk1x/mZ2icosnh4uqM93OoSMXVI9ScVhNrTTYuQH2Or
	jsyv0yP0Wo/t8qF63dV1kuQAwWI951wN086qAcRQF1MFLmSB0j/5qx46ZKBX5lc30IU6Y2Ag4z5
	0XIJJjwx+ti2ZEblKMbSUHiT+88kdbfrHKa6gI+WsDDmdzJG+OkMrWWHzl/tnM40PRis=
X-Gm-Gg: AYBFou1jxpuBUBt9mNnGvqCHAaKPHpb51uqZjOjcjvsmVg16dh2GQhOzRIpouIY7Dv+
	MPdVazCG0Z4p76dB+g4ssbU3pv40fRh0rhM3GCOwxgRoKihpVhrW5MlTdarl0vgikWWIkmG6UAQ
	gcALsIFTuYZuCRu4PlsHgIIGfX5p7E8DuTZW0tqF6xgIiJZZvg0K4tIwow32Tbkz/qufRfXJR1Z
	ve2vaWfnD4W51kwfItKJjNpVWqupsi/wOujDEjoULN44JKeGLn6ngiWS4YkRl/j/rcZ+6bUorw2
	vkUr/JRPtf0fpmUVk/1W7OXfXud3XA79d8kodAyEFUXIW89He27bO1uNr/vzLloT2YU1jWQFDa5
	rDn8bLGEkL0xlrbn7+wcT1mUG4LVgc7yr0PZNvfX1CpM8Y7OeMp6ogU+123dFFO8cS98vIB1fc8
	Can3AL74NLD4M3
X-Received: by 2002:a05:6102:578e:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d072c3295cmr5232516137.18.1793698950994;
        Tue, 03 Nov 2026 01:42:30 -0800 (PST)
X-Received: by 2002:a05:6102:578e:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d072c3295cmr5232505137.18.1793698950432;
        Tue, 03 Nov 2026 01:42:30 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm24165306f8f.20.2026.11.03.01.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:42:29 -0800 (PST)
Message-ID: <95d29a93-fcd1-4aad-a6a9-711c8adf3854@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 11:42:27 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence
 tracking
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
 <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
 <CAFEp6-25K=DURpYM96o8vMO8pkVr8uf=r2RAP-kcM=Rme=8JgQ@mail.gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <CAFEp6-25K=DURpYM96o8vMO8pkVr8uf=r2RAP-kcM=Rme=8JgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CBJN45uwIEDgFAMJBzdHErCKEUnP65gT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX426HC6eYwIz7
 8ztFDKqFliJ5LSN8/ikPS7BZ8g1/wqE9RACfhgk5LyAlsl06CVKlPpePqoP03eJT86rdJG8UY9O
 1AyFne4Ydz/qBuQwtmiu7bS29pcE1DZ1Fo8CxOxE6X1e+RaPbOLhetbwzkgXSJEaFn4vvBRqY2b
 FsTWRpERIgcceb+uOUslXZNynbCkI98ikukgKEHcV8em1bA+3SYGy4qWbkTMjwcDYAHCOAT1P3u
 8krwClDIPGbPhp/aobwqxdqD71WboIBJ7QI5+BrKJG3Itbw+lVTe1Z9mB0zjCnjDeYNU/3iLLF0
 xl4ZEu7xIeekkc2N4yVwhnVe2tq1QXPYfMFrDJIdu+KVfnTr9W4BxbrOHxFGEhKdACa3WJCgbEi
 23p+b9FfHeG4PU0W16wKTQQA6mZYs805y+giL9njwkB8a1pJm1U5FgZIARhjFB/NWFtX6OzF+gA
 kYwYD4n4hdPt5NMUtGw==
X-Proofpoint-GUID: CBJN45uwIEDgFAMJBzdHErCKEUnP65gT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX8svdUTHWP7BC
 EKqtDqdJZaL6PZf7VbIyC95LP1Iz11QmBleuRPq7o8xw4u5+AYLx8vwgBd3hfXMecpAfux0/uJ/
 XFGuOyplJLZEAUklXaj386hiqan3WwY=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9ac88 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=NJZkfsSwHKMJFq9xQC0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030038

Hi Loic,

On 11/3/2026 11:33 AM, Loic Poulain wrote:
> On Tue, Nov 3, 2026 at 8:11 AM Gjorgji Rosikopulos (Consultant)
> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>
>> Hi Bryan,
>>
>> On 11/2/2026 3:56 PM, bryan.odonoghue@linaro.org wrote:
>>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>
>>> In order to communicate to user-space CSI2 SOF events we will need to hook
>>> into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
>>> implementations of FRAME_SYNC have CSI decoders which support the event
>>> always generate it in our case if and only if an atomic user count
>>> indicates it should be so.
>>>
>>> A flag in the CSID descriptor indicates if frame_sync_en is supported so
>>> for each SoC that supports it this flag should be true. Since bool is false
>>> by default no negative enumeration of existing or in-flight CSID is
>>> required.
>>>
>>> Subsequent patches will enable on a per-CSID basis.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>  drivers/media/platform/qcom/camss/camss-csid.c | 54 +++++++++++++++++++++++++-
>>>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
>>>  2 files changed, 65 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
>>> index a00791b00feb7..e9b399fcb9c7a 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>>> @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>>>  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>>>  {
>>>       struct csid_device *csid = v4l2_get_subdevdata(sd);
>>> +     unsigned int i;
>>>       int ret;
>>>
>>>       if (enable) {
>>> @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>>>       }
>>>
>>>       if (csid->phy.need_vc_update) {
>>> +             for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>>> +                     atomic_set(&csid->sof_seq[i], -1);
>>> +
>>>               csid->res->hw_ops->configure_stream(csid, enable);
>>>               csid->phy.need_vc_update = false;
>>>       }
>>> @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity *entity,
>>>       return 0;
>>>  }
>>>
>>> +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsigned int elems)
>>> +{
>>> +     struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
>>> +
>>> +     atomic_inc(&csid->frame_sync_users[sev->id]);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
>>> +{
>>> +     struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
>>> +
>>> +     atomic_dec(&csid->frame_sync_users[sev->id]);
>>> +}
>>> +
>>> +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops = {
>>> +     .add = csid_frame_sync_add,
>>> +     .del = csid_frame_sync_del,
>>> +};
>>> +
>>> +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
>>> +                             struct v4l2_event_subscription *sub)
>>> +{
>>> +     struct csid_device *csid = v4l2_get_subdevdata(sd);
>>> +
>>> +     if (sub->type != V4L2_EVENT_FRAME_SYNC)
>>> +             return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
>>> +
>>> +     if (sub->id >= MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_sync_en)
>>> +             return -EINVAL;
>>> +
>>> +     return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
>>> +}
>>> +
>>> +void csid_sof_event(struct csid_device *csid, unsigned int id)
>>> +{
>>> +     struct v4l2_event event = {
>>> +             .type = V4L2_EVENT_FRAME_SYNC,
>>> +             .id = id,
>>> +             .u.frame_sync.frame_sequence =
>>> +                     atomic_inc_return(&csid->sof_seq[id]),
>>> +     };
>>
>> On first look this was looking strange because the id is used for the
>> control id events not for frame sync. But on second thought it may make
>> sense, but the question is how the userspace should interpret those ids?
>> As of today userspace does not have any info for the VC and csid internal
>> pipelines (so called lines). So with the current state of the code
>> the id is VC which makes sense becouse the SOF/EOF packets are recieved
>> based on VC. So i am thinking of two options:
>>
>> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-device
>>    and will be well known to userspace for which line is reported.
>>
>> 2. Add and propose extension of videodev2 documentation that
>>    id of frame_sync event types represents SOF per virtual channel.
>>
>> Personally i votoe for (1) because it will well fit with stream-api
>> support and usespace will have clear understanding of the SOF to which
>> stream belongs.
>>
>> Given this in mind it will be good to open discussion with Laurent, Sakari
>> regarding SOF event with stream api and GMSL cameras.
> 
> I think both approaches can be applied independently, forwarding the
> event through the VFE as event proxy would likely be a straightforward
> addition.

Yes i agree as well, but the first need broader audience and agreement what
should contain this id.

> 
> Note that the id here represents the interface index. While it
> currently happens to be associated with a VC, that is not necessarily
> what we want. Ultimately, multiple interfaces can be configured for
> the same VC.

Yes and that is changed with stream api implementation, and the
following question: what should be the ID when streams with same VC
are routed in more lines (hw pipelines).
But that depends on what this id should represent.

~Gjorgji

> 
> Regards,
> Loic

