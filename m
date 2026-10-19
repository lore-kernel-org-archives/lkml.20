Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1E8498922
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405416; cv=none; b=XtKwI8bxuZ7547HOFm3tWGvb9OdpsUjkrRVmiOfYcMkYmBqv8TS5jidnCfu4V12uwHzSv4j7BipPi+Fmo4+yHbu6K6RBQkeMvGCuYgMjAg+gJTfKyf2yZj3gBfNpxGB2hafv3SAPJjZTo6dpVzXUa0J0v8bqOxvbM8qnSp7vBdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405416; c=relaxed/simple;
	bh=he4jRUbjixW2myAcIDna/A5Fyza/iOBeo1m0W82jyYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WO5SQhPDD5tRjkE3iJOzoAL5BVYtlA3Q7H69w3qemdaid6VRP8SCQUee7UmmvwEdBOko+frPv0nAGaeDj4seqXYjjGntu+1JAYbxNV35EsRzIY0eks05dKjxzb+Yh1BA1GaGPtDilKbO4xpzf7hxWxN/9UOPYk1dTuuRAdzHn7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCPQ9T5L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WBkpXS74; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCPQ9T5L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WBkpXS74"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Orjl1348196
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hlSC4ym8FdVhEbqN6PRusBjJ
	cqcvn0MSu8njsOjiNhY=; b=FCPQ9T5LBxSPLejGr/QLrt3ljJyFc3jSA1YDfaoz
	5VOGam+166vMocAJCmLjJZG3BqheAWBt65me2GT1f9Heot45PIjOTbn4gIOjzvtz
	UaLYK6kTBSL5imsEVNMqAG98A1cMqFj4k3Ieesu2W2lvGIhXHw+lU2wBtGc4NJKB
	fDbxH6/4wQH5A9wcStYcyeCwdg7hRBCWGYzt3IomD6kpKmZfMheJj262fV0JsUf7
	r6nhtvGtV/TfJpUPdz+FzhkH8TPIiQpPWvIvt7EvjNFLn1YMWsHpY8rGhZ5egr7W
	iH+rXYCmjW8j+rwmiAPslgfNpTcanrPsvIvBxgPPIRWIpQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rgk90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:23:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so447022585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405413; x=1793010213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hlSC4ym8FdVhEbqN6PRusBjJcqcvn0MSu8njsOjiNhY=;
        b=WBkpXS74WIq0Fb+6xwk8z0GcB/yXArVAc9dl793sHg/ia/e+5eTekAJ9avjpyEoVV8
         ipfrOPf1UJz/xSZgvUOiwYZSSb4iQrItnqUki/hvOSz/6yjnDUJSlp3RLJTc1Vy2RzMw
         ZhDwhUtXk0k63q+6lVvywUbntdtXKcgl6xXRzmXsbYwt4WwBciCeokNCaz2OFZoA5KGB
         QUc9TKKUNVcW6Gb77z9e1BKnET2f4KyUfdrPsg5n1QlpFsLuPyp4bWlwgsl3cbpT9pT8
         DFSb0LIxMlgkG5NIgQDE1wvY0e//zNHVyicEr+S1jkobu31649whTqXmAh0RP5JrzKSn
         QnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405413; x=1793010213;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlSC4ym8FdVhEbqN6PRusBjJcqcvn0MSu8njsOjiNhY=;
        b=sxdJkldAPRXJ6nY/Yk88oCDTLOQHw/mEczYDLazr5hLJOV9oOICCGXQ83Oh9lUNxm2
         Oda2I0f3HGlaAWf0ycFSJC1U9idylGdhf4fe9LO7O8vxdGfevh94MkMTqv4U4mDrJrGR
         GYzKYIb7ccV3QOMGMSnHzVNtw5IFIWYLSklYhEo4Us/lbTN35k7FUiFhyiKDx8Ppavw0
         LeVfsAV6+1XzqqSw4Uv6HaA2qretdwviarJJM2mgq663kqIMyKXzxB676hQtaqSfN5Qa
         qbMxMgBmdAUaccBzTgvDoGBQthGMVAc7XCvj6CTwJ4vtisXJZstUPfHfFGD2WINM3Qjs
         GvNA==
X-Forwarded-Encrypted: i=1; AKwUvBzA99lydcM+cxLFtrP20PTd9jXFdTKx8peN9jJyTQeGcpNpbD6ttTXqvb6bvon6hn1NW1fIXNwhjmZKjKQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMkM83K63LmyFgj5DSHFVnfii5nYh45p4Iejz9BzlnqLtwDc1W
	Vz07HvyjBiEi6wSBtmLpCX5r4i723tIuaCY5tqRE+xHWffh8nj7TJO3n7t1xep0B6mCBCLnoH8t
	Uk1vadCtYDtvTG+cuVHiXbV7hoLcXW/FnJIF6sz+LQzJulDEn8ST8FVz/WeJ5tKUeibw=
X-Gm-Gg: AYBFou0r2dHarH9zYmoREOfwI6NW3meZlvqtnYieWzcMiS+0LXfOyTVwtwHqevZjgyX
	1iUjX9PstRsYGebJsLxSVKSw/GFameEPDDJvqU64etA62KZ7OTF5ezu302YZkvkNOJelEljws9Q
	NGL/pSgQzClZWwoiChG+IQ76miSCVWADnW7Hq9j3XuKTSVcm5C3Hb688UbDLZRj5HF2OMdXzU7d
	C2YNblg+HJaIfyWB39RyFNuD0OlMWfJiCE26nwDBOAOzAvMEutSQGgy5mwXGsohbsghELVZB0pw
	Si/k/pExio9YiP1au9EpEorWXaTcjd0w1krIouCf5MOY27cD6rSrdjue74QxBJNsgo8yXKvNPg0
	SRnJPdqMlWgmk3dbd
X-Received: by 2002:a05:620a:7114:b0:93c:2726:77ec with SMTP id af79cd13be357-93f29b9b12bmr1216191885a.5.1792405413114;
        Mon, 19 Oct 2026 03:23:33 -0700 (PDT)
X-Received: by 2002:a05:620a:7114:b0:93c:2726:77ec with SMTP id af79cd13be357-93f29b9b12bmr1216188285a.5.1792405412359;
        Mon, 19 Oct 2026 03:23:32 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d2e93a01sm259473815e9.0.2026.10.19.03.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:23:31 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:23:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: vamshi gajjela <vamshigajjela@google.com>
Cc: sboyd@kernel.org, jwylder@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] spmi: core: Add generic DebugFS interface for bus
 inspection
Message-ID: <n74qtvpfgvoqzofmjfmdq46i4dgfjjzwhq3g3jon3jtjp66sie@g332ulsz3vta>
References: <20261016163058.121440-1-vamshigajjela@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016163058.121440-1-vamshigajjela@google.com>
X-Proofpoint-ORIG-GUID: gb4lvANFYXUznbKv3j2_njeXKZH62pkS
X-Proofpoint-GUID: gb4lvANFYXUznbKv3j2_njeXKZH62pkS
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad5efa6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=1XWaLZrsAAAA:8 a=ajkblLjoegZ8st8dIXkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX1kA6PQYtsGwT
 ro9M71SEFsVCSb27+6m89hZXntBSoibYgcOukt+33CWpwNMMqqSl/d2hrN+uFnMfUy0/XERXr4R
 OTTFP6bV61rjiEDPjbTkljwDhMjTayXELJ5Pys01UJ9lGmB0dFhZkTve/Xsh8JGFqDfjikQAcrO
 MA5ETefGjGB2dWUfle4ylVo4t0zYCEW9zZOZfvGfgFRA6+X8BIVNWGHYTNWUL7o1sJnpMSsPc9S
 rH7a5EG90KkkZqgIAE6YnTeMCv97YZu/i7LaBbXyEMdP72oOtS6E5VkPSux8w48TrhHdCGpPvQQ
 /x5ZG3Bdr8/MSdArdc2lIfufeQ5o6poyXRUUclOaqHivJabXridhWxztWhIKUsfsI3aqDm/F2y2
 1Z45D5AaT2h1ZeeqKIOaOfevYT4H6bYNibLkHoviTcMXbUnAziFtXjJqixqsQZzLE0ifsoUGg59
 sg0bxKrU8Gg+Bn4ojBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfXzXC5uzr25ttB
 HafAGfEQmDD/HpG/uSh5LMONPMRJGY3CLC2gnWPDJUC/pqDmAe//H6sBN4OgnAsDpjuvFk3A84/
 7qFMUsXIlruND7nAjwhpd6eXFGarZgg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190041

On 26-10-16 22:00:58, vamshi gajjela wrote:
> Introduce a generic, controller-agnostic DebugFS interface in the SPMI
> core under /sys/kernel/debug/spmi/spmi-<nr>/:
> - name: Displays the controller parent device name and OF node.
> - detect: Probes the bus for active slave IDs (0x0 to 0xF).
> - xfer: Transactional interface supporting register reads, writes,
>   and directed command opcodes with automatic opcode selection.
> 
> Write and command operations restrict access to root (mode 0600) and
> mark the kernel tainted with TAINT_USER. Runtime PM is managed
> automatically across transactions.
> 
> Detailed interface syntax and parameters are documented in
> Documentation/ABI/testing/debugfs-spmi.
> 
> Co-developed-by: Jim Wylder <jwylder@google.com>
> Signed-off-by: Jim Wylder <jwylder@google.com>
> Signed-off-by: vamshi gajjela <vamshigajjela@google.com>
> ---
> Changes in v2:
> - Rename spmi.c to spmi-core.c and link spmi-debugfs.o into the composite
>   spmi.o module so CONFIG_SPMI=m builds cleanly with CONFIG_DEBUG_FS=y.
> - Route DebugFS bus operations through spmi_read_cmd(), spmi_write_cmd(),
>   and spmi_cmd() instead of calling controller callbacks directly,
>   preserving SPMI tracepoints and core validation.
> - Allocate a per-open-file struct spmi_xfer_ctx in open() instead of
>   sharing a controller-wide buffer, avoiding races across concurrent file
>   descriptors, and store struct dentry *debugfs directly on
>   struct spmi_controller.
> - Reset *ppos = 0 on register read commands so repeated transactions on
>   the same open file descriptor work without manual seeking.
> - Restrict SPMI_CMD_ZERO_WRITE at address 0x00 to 7-bit payloads
>   (data[0] <= 0x7f) per the MIPI SPMI specification, falling back to
>   SPMI_CMD_WRITE for 8-bit values.
> - Parse register addresses with kstrtou16() so values above 0xffff are
>   rejected instead of silently truncated.
> - Update Documentation/ABI/testing/debugfs-spmi to document per-fd xfer
>   buffers and 7-bit Zero Write opcode selection.
> 
>  Documentation/ABI/testing/debugfs-spmi |  77 +++++
>  MAINTAINERS                            |   1 +
>  drivers/spmi/Makefile                  |   2 +
>  drivers/spmi/{spmi.c => spmi-core.c}   |  18 +-
>  drivers/spmi/spmi-debugfs.c            | 380 +++++++++++++++++++++++++
>  include/linux/spmi.h                   |  24 ++
>  6 files changed, 496 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/ABI/testing/debugfs-spmi
>  rename drivers/spmi/{spmi.c => spmi-core.c} (97%)
>  create mode 100644 drivers/spmi/spmi-debugfs.c
> 

[...]

> diff --git a/include/linux/spmi.h b/include/linux/spmi.h
> index 28e8c8bd3944..237b0b9d4377 100644
> --- a/include/linux/spmi.h
> +++ b/include/linux/spmi.h
> @@ -69,6 +69,8 @@ int spmi_device_add(struct spmi_device *sdev);
>  
>  void spmi_device_remove(struct spmi_device *sdev);
>  
> +struct dentry;
> +
>  /**
>   * struct spmi_controller - interface to the SPMI master controller
>   * @dev:	Driver model representation of the device.
> @@ -76,6 +78,7 @@ void spmi_device_remove(struct spmi_device *sdev);
>   * @cmd:	sends a non-data command sequence on the SPMI bus.
>   * @read_cmd:	sends a register read command sequence on the SPMI bus.
>   * @write_cmd:	sends a register write command sequence on the SPMI bus.
> + * @debugfs:	debugfs dentry for this controller.
>   */
>  struct spmi_controller {
>  	struct device		dev;
> @@ -85,6 +88,9 @@ struct spmi_controller {
>  			    u8 sid, u16 addr, u8 *buf, size_t len);
>  	int	(*write_cmd)(struct spmi_controller *ctrl, u8 opcode,
>  			     u8 sid, u16 addr, const u8 *buf, size_t len);
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	struct dentry		*debugfs;
> +#endif
>  };
>  
>  static inline struct spmi_controller *to_spmi_controller(struct device *d)
> @@ -186,4 +192,22 @@ int spmi_command_sleep(struct spmi_device *sdev);
>  int spmi_command_wakeup(struct spmi_device *sdev);
>  int spmi_command_shutdown(struct spmi_device *sdev);
>  
> +int spmi_cmd(struct spmi_controller *ctrl, u8 opcode, u8 sid);
> +int spmi_read_cmd(struct spmi_controller *ctrl, u8 opcode,
> +		  u8 sid, u16 addr, u8 *buf, size_t len);
> +int spmi_write_cmd(struct spmi_controller *ctrl, u8 opcode,
> +		   u8 sid, u16 addr, const u8 *buf, size_t len);

These are not exported, so they can only be used from within spmi.o.
Please move them (together with the debugfs prototypes below) to a
local header in drivers/spmi/ instead of the public include/linux/spmi.h.
