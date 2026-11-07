Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029975;
	b=EncLMiMbQaE4X0wtQo1vPIYEES7jkHA4GANke/0vlvffdrvzcpbLdxCdzK7gkFrfpXYl
	 ObhgJQr0tc5bUXxu7WBTTGNHXltHH+73VqpLX5zq39XePIRrZMm4wZBdKhqQeqEkRkGXz
	 boBcKIjc9yOSoXkARjOBEroQ42xywXdTRs97Zv5/7EiL9LZUc587uzDYh8DwR7ZHwKK5F
	 IuYCf2IMOIQjqiUfBiILxUkRsV+UZ8K8swD8rQ28Q7PE9ty+ruMC0v7IWfeOwZUyjzEYd
	 nAiz8sJkyv7dDxVI2aI+wRsjC3UFj17PDNUSTNqkAv1oPTtbYo/pv16T1UP/XgzuW3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mf4ZlSzQK0A1YfaXfnQYSWywPw9KHcmgJ0Zlx/5jJks=;
	b=dAW8B3Z3eyxLmE6St9F5UvcCDAxkIJnhon+VYKqq8ERUVgMKdguiSVJNlWWHnd2KqbrH
	 xIlxHX7QJEz8W6V219R168P1qYtHthR5an7BanVpxr/iWWMRhsX2YZrDOV5U+KePiNwLp
	 ya/mTPTya59veBeLGXuQ7/7wWSv4S/jF3rXA9Wlwmn6K4f8caviU7UWfqkwXKuc3GX0vv
	 5C1P2+QV/vmyv4anveQlvDjxvuue4CwJ3W69qyQBGDxgnrVFE9t+UBAhFuDNW1pSkbfv6
	 jgIHu0NAhwB63uq9DgzhaRrvAbCLI6Sd2SF4kH6DdXE4Ro7xSr9mL1MPvVvPL0dXRnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYxxEQoA;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985FB606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 985FB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYxxEQoA
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso531146a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 21:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794029974; x=1794634774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mf4ZlSzQK0A1YfaXfnQYSWywPw9KHcmgJ0Zlx/5jJks=;
        b=qYxxEQoAgeRTjMwaQDC2fAV485jTtyVXXUh6AN8P3ryYgsUwS7AzrM/L9YOTmUktBL
         GrmxIh+aph7bmf1AxySbrEQwF1kVvNaiFABat9MAI0HWL4TvDQAeVqzgzJuqtoEuw6eQ
         lXAm0ibaN7snVWedEdSBLO15ROieRTahbPsvyOWVseeXVlO35wemXKH3VSUJhQ0Lx4V7
         yrTBrej7U/w/9xOobPcuIsCY53gGXyWvz1TUQHwH3AJNJsnHoe5Esl5h88vkgrjdYMVK
         1usU1L8rLYsy61hnyX/H7fDmdOaYfPzLbXxMCOOAnoSzAfkb1XYCAlLKarUsU5kGF+KS
         +3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794029974; x=1794634774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mf4ZlSzQK0A1YfaXfnQYSWywPw9KHcmgJ0Zlx/5jJks=;
        b=SnbZIBNCJI6GX48sGum6kOFSdBQOUUAdShMqcsOFLTzRXfUj/IkkftLrjYr/FeQ0KY
         Vxn91PpSY/+Onvh3BwshqRS9urF08FVLd8eNn8iqjg7nddxdA7+NqmqCCKTSx60m+utx
         WxThpVhBFP/owFOpRF1eah36Jz5+APUtoMhbII8kiI7tvIxlVZOOGRtPESu2thLSmf4V
         i1B4ZDvCanjFU3zb6IkS5slqNYUdWccuji4DPysNCqVG4Ri6GVWGez4CIgKgdDMVdDq4
         zQEr7jckiIYiM3HjJpyyedeINCyLlzn7zS51OsyEtrhKV8k16VTiWJDGPGxgG0bYqQzI
         7jTQ==
X-Forwarded-Encrypted: i=1; AL+hErHcN+iStZDzrbVgVo0JDi3hSRuVpo/8AzMg5ztrJ4QMvGMUsfiFkbpZmu3MpCSqTBItsnU4OAeLgSDSKnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0w2+xdT3OVNs+iivsab/wypQEDmUys8pz00xI7PlMGYW+GEdR
	utPfq+uPxUBGpsWWme5e+axwl24b6izlpWDBv01CgPdEwVhevxihow2J
X-Gm-Gg: AYBFou2tVmD+VAcbNqmLp/paMIAJmQvQzexzki3CbqaHLIhYXssl88I2PZzUK/852ib
	FVQGwd98ix4CRlH0jlYKVqwfjrT7e9b8Vl9J0zMN6jJPMrcVx6b8cUHg/WM+CtBI4+8jyjRx16o
	AnVdr2Qt+u09WBIWbJEnxFzrqcKkalSTBIlYBpDHATeOXo97UIjbbori+tTLTcn0t/4cxYhM4rv
	cWy7dP5R5jQ7b0SgXb8v96Nj+nVcZgU06vzXOmfXasZ+vx5NbpCdfg6GAC9IFA5sSsqchpUIzll
	0WQ2plqenCtvXlJ/kFMwRBJaK8+fdRW/NDWhuOMxFRgupmuul3bx89BbVQIKZJdf/ESO+PWzKhG
	vn2K5Ca8YVbnF3mQGdjj/4b9LEj3pD4NYmmOmi06HoBDsdZT/zOZFc6DEGBAqV4ZHw1h5w0HLo7
	2UDa6QcnzRf2U1ZD63SS5Cjxo+p1tNan4MyCwH5B+3/jv83+iFc0YZwPk7NMtN+vql2ZbHEfANJ
	UnlbdgGmuj2seIcXjDS4X2Qi4t0ycVQzY+CJAjA6p5oL2UIIH3Wu2RFaaOVkePI55BEtWaMe1o0
	hLB9IyAVmqVZFRqQb00fG7ORg6M9Etktp950hbEj1diArhuX1STLG2IPdKFQcqgRh7pruw==
X-Received: by 2002:a17:90b:3950:b0:3b0:92b2:2e74 with SMTP id 98e67ed59e1d1-3b0db6f6c35mr4733562a91.62.1794029973785;
        Fri, 06 Nov 2026 21:39:33 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057b17f8sm1838127a91.1.2026.11.06.21.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:39:33 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [RFC PATCH v7 02/10] trace: use the stackmap from the ftrace stack recording path
Date: Sat,  7 Nov 2026 13:38:58 +0800
Message-Id: <20261107053858.3070072-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103193421.63f4454a@gandalf.local.home>
References: <20260912083753.3426176-1-lipengfei28@xiaomi.com> <20260912083753.3426176-3-lipengfei28@xiaomi.com> <20261103193421.63f4454a@gandalf.local.home>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pengfei Li <lipengfei28@xiaomi.com>

On Tue, 3 Nov 2026 19:34:21 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> FYI, the tracing subsystem requires starting subjects with capital letters:
> 
>   trace: Use the stackmap from the ftrace stack recording path

Will fix for all patches, and use the "tracing:" prefix that the rest of
kernel/trace uses.

> Also, did you use AI for this? Most of the comments are useless, and sound
> like they come from AI.

Yes. I used an AI assistant to help draft a substantial portion of the
code, nearly all of the comments and changelogs, and most of the test
programs. The design decisions are mine, and I checked the test results
and went through every version, but I should have trimmed the comments
myself before sending. Many of them were added in response to automated
review findings rather than to explain the code, and they stayed. I
should also have stated the AI use from the first version.

For v8 I am going through every comment in the series, removing the ones
that only restate the code or the review history, and keeping only what
the code cannot say. v8 carries Assisted-by tags, and the cover letter
says what the assistant was used for.

The rest of your comments on this patch will be in v8: a record_stackmap()
helper with a stub, the depth check before loading the map, a named enum,
the tracefs setup moved into a helper, a stub for
stackmap_mark_init_failed() so the #ifdef goes away, and the comments you
pointed out removed.

Thanks,
Pengfei Li
