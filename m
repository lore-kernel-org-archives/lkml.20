Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908394;
	b=s0zNO7KBjU2c6WefO4zS4FLuFzZ4qi4ObbTt+hTDyHgN2Ii5XunrlXHrDjkgWXztmCj8
	 jD5fouDbFUY1leur1aBJK2+ndhLLkllExgTFE9GTXZculBYzH0avi/tWg57oEonhbjeaM
	 Q/9vNdT01p++KfDAw9+x4eBgo5bmWt4DVatGPhSUsFVOS1r54T6kr8Wrns4WfyLxFXis/
	 +siItU2KiajcCEOl2JwbUfIzWzWQg9CUsWUVBjkI50NwLPx7t7ntSNB58RuB07Rg5tH6H
	 Vou3UIRIVdnvbXwVW18eG1qAM0Mtv4bKaML/Q4SLkbKLXTre9sLK1QAkwZ66DEKzrNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908394;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jkwCDTDY34gysHX4eD/Jtbt83iR/Xm5caRAcO2dYSpk=;
	b=LyTuh6HjnWlRurnHQojsLA+kto/JlHpUqQ6p4knxZg17GL3r5dqhLQ4IubDn33/YAAak
	 Z4Nx0n8CJ39zRyBwS9Ba2ZCqYMM7om7eBtggOP6tjldRzvUS4oFGh/66c5Gs57yP5SgW/
	 XkbBk/2IlCBk7A1v+LFHkYkZ3N4ImJgkP39gLZ76VncK5CM6Nhc1V1DGQ4Xn8uI+fa4rv
	 MMyOpWngoEK1XLfOCTXXpZZzUvkl/ymMtxzojqKGnzfhyB1AWNPI/dRfDOuDWXcZBTwBz
	 BpIVcnYIRT55git5CM4ry8ihdLuP7iLMiPdRc6luhhDzy7IA6btpccg/Ue7dN3Bvsug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MMCeIdX/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IhMV3eks;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E343F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E343F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MMCeIdX/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IhMV3eks
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8petm844355
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jkwCDTDY34gysHX4eD/Jtb
	t83iR/Xm5caRAcO2dYSpk=; b=MMCeIdX/qLiJeARaBfQjBVicy9JDQqcVTluqTE
	G3JPO9FlBLxUM8656v6aNX4e3SuaC2KFg1tCW/bSeTg++o+DyYOrgxx1ZMYuzmbW
	wgzKlbDncDj6ZHri3BtcXa2fXw+p47GftulV/i0/vXDz1PAE+ploI357fKG8RLEV
	GcZIph2skaH70mhCiBxzCiBdPPqqh14vPap72N1uS2hD7ri2uQpf3cWC9ZtVSqWF
	Cbgk3AXQt3PYpAosLWehozKze9ZYqn6it2kTlqQHov65tZGpayzh8Ead+wu3uD+q
	WNIgJ1x1PD+I2eBqeEg0i6cN1qTWTtzZBFsctbYL+BeP9eXA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h1uv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:39:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb90a6230cso2216229a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794908391; x=1795513191; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jkwCDTDY34gysHX4eD/Jtbt83iR/Xm5caRAcO2dYSpk=;
        b=IhMV3eksm4T6ReBGPsQjEU12EKRUzidfFlqe5qA8xjfzf1tDa/3cO/dzk3ypRH5puY
         sobgOcCVSNaFXwYAkIiQosiFAvY/93kGjTD9AHkhc+ypPPGjWaldp2bK1xzj2xgPfuJV
         v/r1KUANFlSy/WJAd+G/Tj5ZJsg+UiQSb7fazdTQGeJ0ZEusBEhyJDAJ6d6Ppx+R0HaT
         RTKqIbmi17uxwYtVxCBUDYptl5FkChjnQWLJXZmHDGABRXDAb784hvWbi+qHGcWkr2BH
         czucNL2r4htUvbV/ffaPCoG+8GcZLqVZH/drMEkNuKApfllhH/rsp7BuT0Fqk+QWfYy+
         hB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908391; x=1795513191;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jkwCDTDY34gysHX4eD/Jtbt83iR/Xm5caRAcO2dYSpk=;
        b=UmXh/9SI5alVKfgAMNilxw9yW4nwcG9Gk2Ka4nvXdsUzMRr1FEAR6gin179w0IeLQL
         jLVM0EzbUPb+CWKiR0d9De6hT2Sql/OcLQcCT5Ip6i1rhcYfU5n7/O2gzO/8jrJoz1rg
         BQKVin/7Gp0cqR8bi8M4OFBh+Jg9J1fWq0KAAKPmDeKFDyxvOku0oHT/764MD3s2Dh4L
         6SYaAi/arJ0s7vzqwWAz6aD5VWaYoi8AY5Kgc53nZBy218gj27Z2yvQCJrpXlfvODBwl
         4/E8cNByzGLqPZbetJc96+zBVT+Ou+ui6Y/nf8TOh1mhNu4RziVabVjJi/lqgZSKXRJ5
         LRog==
X-Forwarded-Encrypted: i=1; AL+hErHZVo2y9HLjI6mIT5Tku2Oa2Yu8/xwbUxtvbqeVa4OQlT0M+36qduxEVlHw5ksvxYHL9oPgV59gUBYQli0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n4Hg7VncJJDzBxeseQGQ+ctljTCDduDk7Als+twBQXjsoyq9u
	KE+y+DY2GD/z2r1Ap8qOKOO3qTqvZOid1U7cX1bu3rozFErwq5Zegdw51Jzgvh60YTPwtErtdh/
	IUJYjYIQNf7tDIbpaiaFLUnR9Acq92tQh3/2tYUq6WYYIDkgCoFCFmJLPhdxVJQV6L2I=
X-Gm-Gg: AYBFou2puWG9YNhL6JDfeYnL3t30BLf9GcKlCq6EU52hHoBdoy6gHGeb2rN6HaQ5QuM
	mrQKHiYvLFIZD8MWXF8tOQnYHQMYuEzUYAAfQdTZMpchVpHTCNQPHQ+2vwY3Bs4gS3+PPpQzgWp
	uEqMrk3ahEmSjpC4AQyEh+4UMiXMGhfOWpd7De91UtS9T9/qXw3cikFRfDE4yuyolRX9Zfxnh+x
	z2K4CtlJjcLkTLaFE0023ZgsPSypHg2/TKrWxzMnlF+qnuDNonz3DxmTSMsu5txFq3HxrUilJ2G
	nhzC727Yadc2YFkXA0JQivWVj4pe2PNtbTwK0rfKKq1FUU1h1L7ZS9DzX3VONZh3rmYPaPixP2M
	meJBKCZoVmIACmd521gfvRobx5d6zC3PAxUI6iTvN7h5kybKHKEHnyd8WuQ==
X-Received: by 2002:a05:6300:8189:b0:3eb:a628:10e9 with SMTP id adf61e73a8af0-3f7a79c61ffmr10478973637.39.1794908391417;
        Tue, 17 Nov 2026 01:39:51 -0800 (PST)
X-Received: by 2002:a05:6300:8189:b0:3eb:a628:10e9 with SMTP id adf61e73a8af0-3f7a79c61ffmr10478956637.39.1794908390903;
        Tue, 17 Nov 2026 01:39:50 -0800 (PST)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc160bfabsm5299078a12.4.2026.11.17.01.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:39:50 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Subject: [PATCH v4 0/3] misc: fastrpc: fix context leak and hang on
 signal-interrupted invoke
Date: Tue, 17 Nov 2026 15:09:44 +0530
Message-Id: <20261117-interrupted-invoke-v4-v4-0-2320a8a7eda2@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOAg/GoC/yXMSwqEMBCE4atIrw2Y4Iu5yuDCaDnTDkTpxCCId
 zeju/oW9R/kIQxPr+wgQWTPi0so84yGb+8+UDwmkylMrbVuFLsAkW0NGNOOyw8qlmoyqCyaFrZ
 vKX1XwcT73X13j/1mZwzhH6PzvAARkmwQeQAAAA==
X-Change-ID: 20261117-interrupted-invoke-v4-f2e5be78eba8
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        quic_bkumar@quicinc.com, quic_chennak@quicinc.com
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 5t5W3xijBYCrNTs3C6QsyyCXaMMBbiE_
X-Proofpoint-ORIG-GUID: 5t5W3xijBYCrNTs3C6QsyyCXaMMBbiE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfX6clZYPvRiHCe
 zidZ9FeCaCBEQmwZdt4yw4eo8eurkS99yklFnrIDVvfo49prKxbydgcvPVO52HqiD6Psly0BWpL
 GJzHedd3r2/s5CZxHSbZ/Qqyk5fiqzv31eN6xuqll3NXfCY3FSryJIt2gzwMknjruyDxko/fRIh
 PQwb3AKjjO5Fx5OZPn/kGyHsrgzyGtNB8PKEd7lwZwD3fbOHzqXPB5oReyT+6ipXSsuTej0YgX7
 g8aS777y876225i2My3j+lKOZfK4wdBsvI//MAsRvvoiCM1JGx0bJZvNIg56l54WIbhHiZsTHeW
 dYvPM2KSD7JFGPs328+Sz0fNKl/BDptDfAiYZXGxirl/25TwT5Z8QeX8rtGracW7SbMF0kigsH3
 QYPE4m9pieEd7ZOdqo3As+K+B/kj0y0Mc9mdJRy/c4cSR0nl4SX6IMdFpQpXOZRYQFPA3PTm9U6
 jDZSDvSUHNW99UVfdEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfX3XPcUz+fHftr
 loyuvdzPh98UIzxQYCe3wrgtHNQObiMPsI49rlBzH6Hcmf1m/ZQfbdzsCrwTOZJAVWcQknH5SgP
 kzk7ndZlh4A5ogmpetoxX3Ak7Cw4eFs=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc20e8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ag1SF4gXAAAA:8 a=e5mUnYsNAAAA:8
 a=COk6AnOGAAAA:8 a=-vHKDIwpwqHdDy8GyowA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170038

This series fixes a context leak and DSP hang that occur when a
fastrpc invoke syscall is interrupted by a signal (patch 3), plus two
independent, pre-existing bugs the refcounting audit for that fix
surfaced along the way (patches 1 and 2).

Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
Changes in v4:
- Split the single patch into a 3-patch series. Patches 1 and 2 are
  standalone, pre-existing bugs the refcounting audit for this series
  surfaced - dead code in fastrpc_user_free() and a worker-reference
  leak on SSR for ordinary (never-interrupted) pending contexts - each
  with its own Fixes: tag, landing ahead of the actual
  interrupted-invoke fix in patch 3.
- Fixed a hang inherited from v1-v3: fastrpc_invoke_send() failure
  shared the same bail: label as a post-send wait interruption, so a
  message that rpmsg_send() itself never delivered to the DSP could
  still be parked as resumable, and a retry would then wait forever
  for a response that was never going to arrive. fastrpc_invoke_send()
  failure now gets its own dedicated cleanup path instead, without
  needing an extra flag to tell the two cases apart.
- fastrpc_device_release() now also accounts for a successful
  fastrpc_release_current_dsp_process(): if the DSP confirms it is
  done with the whole process, the worker reference on any parked
  context is dropped immediately instead of always waiting for a
  later event.
- fastrpc_user_free() no longer unlinks fl from cctx->users
  unconditionally at fd close; it now does so only once fl truly has
  no references left, so a context still awaiting a DSP response
  after fd close remains reachable by a later SSR.
- Extended the same unreachable-orphan fix to timed-out kernel
  invokes (-ETIMEDOUT), which had the identical problem on
  fl->pending.
- fastrpc_context_restore_interrupted() now uses kref_get_unless_zero()
  when reclaiming a matched context on retry, closing a race where a
  concurrent drain (SSR, fd close, or a delayed DSP response) could
  already have dropped the context's last reference and be waiting on
  the same lock to unlink it.
- Link to v3: https://lore.kernel.org/all/20261002-anandu-fastrpc-interrupted-invoke-v3-v3-1-31e90439d2ba@oss.qualcomm.com/

Changes in v3:
- fastrpc_context_save_interrupted() no longer drops a reference when
  parking the context, fixing a kref double-put that left the context
  under-refcounted.
- Restoring an interrupted context now matches on both handle and sc,
  not sc alone, so a stale/differently-shaped retry cannot be handed a
  buffer layout it didn't allocate.
- A mismatched handle/sc on retry now falls through to allocating a
  fresh context instead of returning -EINVAL, so a thread issuing a
  different call after an interrupted one is never permanently
  wedged.
- Added a put_work_scheduled flag, checked and set under fl->lock, to
  guard against fastrpc_notify_users() and fastrpc_rpmsg_callback()
  both scheduling put_work for the same context.
- fastrpc_device_release() now drains fl->interrupted and drops the
  invoker's reference on each parked context before releasing its own
  reference on fl, fixing a leak of both fl and the context if the fd
  is closed while a context is still parked.
- fastrpc_device_release()'s and fastrpc_user_free()'s drain loops now
  use list_del_init() instead of list_del(), avoiding a poisoned-node
  list_empty() check in fastrpc_context_free().
- fastrpc_invoke_send() can return -ERESTARTSYS from rpmsg_send()
  itself before the message is ever delivered to the DSP. This is now
  distinguished with a `sent` flag so only a completion-wait
  interruption after a successful send is parked as resumable.
- ctx->args is now repointed at the retry's args on resume instead of
  pointing at the original call's already-freed buffers; an
  args_owned flag lets fastrpc_context_free() free ctx->args if a
  parked context is drained/abandoned without ever being resumed.
- Link to v2: https://lore.kernel.org/all/805d5de8-477c-41e9-b192-d889d1cca9b6@oss.qualcomm.com/

Changes in v2:
- Fix kref imbalance: fastrpc_context_save_interrupted() now drops the
  extra reference taken by fastrpc_invoke_send(), so the worker's put
  correctly reaches 0 and triggers context_free.
- Fix -ETIMEDOUT context leak: remove the ETIMEDOUT exception from the
  bail path so timed-out kernel invocations go through the same
  list_del_init + context_put cleanup as all other error paths.
- Fix dangling node: fastrpc_context_free() now calls list_del_init()
  under fl->lock before releasing resources, preventing a dangling node
  in fl->interrupted if a racing channel removal fires put_wq.
- fastrpc_notify_users() now calls schedule_work(&ctx->put_work) for
  interrupted contexts to drop the worker ref on channel removal.
- Add dev_warn() on TIMEOUT and ERESTARTSYS for post-mortem debugging.
- Use list_del_init() instead of list_del() in the bail path.
- Link to v1: https://lore.kernel.org/all/20260525124222.3082420-1-anandu.e@oss.qualcomm.com/
---
To: Srinivas Kandagatla <srini@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: stable@kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: quic_bkumar@quicinc.com
Cc: quic_chennak@quicinc.com

---
Anandu Krishnan E (3):
      misc: fastrpc: remove dead context drain in fastrpc_user_free()
      misc: fastrpc: drop the DSP-response reference on channel removal
      misc: fastrpc: fix context leak and hang on signal-interrupted invoke

 drivers/misc/fastrpc.c | 187 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 146 insertions(+), 41 deletions(-)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261117-interrupted-invoke-v4-f2e5be78eba8

Best regards,
--  
Anandu Krishnan E <anandu.e@oss.qualcomm.com>

