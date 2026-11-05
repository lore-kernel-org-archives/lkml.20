Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793861258;
	b=sE7Zb9dTR0Z+HOgoPPvyT6WwZcry+KOetv7iMofUzWWaE6JjF7p+eDpz1bXhdWj18Yjm
	 WIariOOldTbocGWNPTHcFYUXialyCjN8mC6Xnc9BzeQNHG5qPy+Xe4JlFJ2PAPT1pGkNG
	 eZeeO/OVxgEzSas6+wAqfz/l9Y+DOsAYIRli0erdpiYjD1w04rFj1Oady0qIxv7s16N0k
	 NAq+tS31Uk9JF7aezJZ+/dcfIOoGLx1pxQAtssIlSMKA1o0OEgySE56VrH73u1v9IZFYP
	 QcM7HSvIOb3JDri8lguAgUFn8cU2W1WHlRzF5y04kX0OVb+EI+MnHYhglwzTtn8dxsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861258;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=y8vL7kxoR7SzZztx/rZLqHDEEm7PeYDs33h2gMA1c9c=;
	b=IEdttekGtFcGMxLmO27ycj+JNhgB5HIrzFLzrAIZldbwkMlxbtx3eq9INh5tjtRE+3NX
	 RQpRGWMCpG0UCfL1nQYsIyoyFSOr1UdizZmWJxTbjCTinXC3C7Ydx7AE4by767LQucij4
	 iCY+9lHIAuMMKz6mIDzg9rEaWqeMc/9hn2YavcsP9r9L7ympIcNsf32cIIXBWXhbyci+4
	 pH1Q1Xej+WfGsqL5e+hE7LoJ6hq+Y5g+/7fOLd7eu6htxz7eq13BLbklWnZVhFgM9qfFw
	 9QhD2/AtIY6qwKNECimxy5tzIHuLxbjwpB/sgqP3WnWfUhe5sXsOAcolQ/hde5+bU0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=xO0yIJpw;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117EE606A31B;
	Thu,  5 Nov 2026 06:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 117EE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=xO0yIJpw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793861237;
	bh=y8vL7kxoR7SzZztx/rZLqHDEEm7PeYDs33h2gMA1c9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=xO0yIJpwSl31rfU+maDi4+Z7UWjq2wnsglLv84FL+/cT80gL+TKbbFCYi+pVLWv7I
	 7w6J9UjLpq/SyAi6mrofOA39vhJJARbKOcz0U1EmggqGj/e83w06iSH5MHssVaExUx
	 fZwNWNYOnQBNvVn+KCESRm6Uo3HiQpczRy2axeVU=
X-QQ-mid: esmtpgz16t1793861235t37038cbf
X-QQ-Originating-IP: InQ75TYjDrWjVR1HZK+vsqw7EkBc6FPy3QXlMoZVjZE=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 14:47:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13246700401697265975
Message-ID: <BC03A4A81DF1016A+99de9ff1-0e4e-45ad-a8c2-1a65a6d96afe@linux.spacemit.com>
Date: Thu, 5 Nov 2026 14:47:11 +0800
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
Subject: Re: [PATCH v6 03/14] gtrace: Add RISC-V platform driver for the
 gtrace framework
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-4-mayuresh.chitale@oss.qualcomm.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20261001052243.3042627-4-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MsUXo4bJCvPOBDKLj6nEUzRfjbHe/qcpf2PTqlAtLYP9LIvM4bKHwZT5
	ZQtc9Ya7eziGLadL9lBOcenzrXb7mtdhlXkAahSKAy9ba9P9Q836MhDarcQFosvu6qpZlG4
	4+eaJgk8LqfJ9GBKrk+QNgtf8DMSxTdcC8bA1Vzo9G4NdVuL759N5w0nm47OTfsPLdZjGOI
	Gj5rnvR4+ybhmgaRp4J07mroZXsLQk/VbDyDBxMdfViHxhUJUmftBfyhuNd1zIKSfbW62kj
	HJlkHNiceJNsiPG79AlWEGM0vcC5OFVBN3vqOJ2C2MThYi3V6xCp7dgSUwM/1tGUZKenns3
	5/Ni0q/DwmjcLA+8CpayZK0ASpbEhOeXSajf/gurGeGwA6biC1O2v1r+hNplyyeJwPouCtT
	RYoaQva/NymWIDoaQZidvPVg+r6ksHN/HyZTx8Yu2C0umPfHyZPLRYkylXE8UeunUisyBOA
	VYattvXPmOO1l005Gw+i1LReyAdGsfNm5AlOUR0PEEdnHj49oVXu4G3ZHAZN5fMj7JheTDW
	xwd7JFIM5sN3efOaEr3BHnF2fswUwT5prK3DyAF8VYU0QYz15puvaVTpmbVmBwhUKxZW58N
	55OWdx8LJ0jrMbVdSQ00RCHQU9Lq5xXzwqz91SnhXHMZTNU1WcJb/eSElzN47wqIuLG1AJZ
	dzPhYIt1zIpWte2wDk3v81MA/INI7GPsCKfnWr7nP/V8TogyGuxOaXu4eJ031s31wIP6HWy
	Rdh2VZWHDLxKbiDD566OR8iRg8PzYvjh6PaOnt0ePCwLO/Cb4sUWiXCaER8SFuZ2QiVib3a
	7zFF087mRjYTf9SyJWXx76bocNe3zcbrQ8tWrdPRKecS41TMMhrZzt+LX5UBLDp9tIWq9TS
	A4UdgCCs+Vl//xbdHqPK49fwBAX/kRRKNFi4Pzt/dF/rYMSr2Y9yvIUyeN8IqpKliz/wfcG
	lyGy6riHBEjbp0++aMUNF86L3PH33Od9dCY+ZCUYlVv9wVsN32sxzXAsxVllOvgo4DSDfb+
	QCK7IKB0pgrD6CoqknPSbG7iaTIu4=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0


On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
> +static const struct of_device_id rvtrace_platform_match[] = {
> +	{ .compatible = "riscv,trace-component", .data = (void *)GTRACE_FORMAT_ETRACE },
> +	{}
> +};

The current implementation with hardcoded .data = (void *)GTRACE_FORMAT_ETRACE prevents RISC-V N-trace
from working properly without extending the of_device_id table in the future.
This directly contradicts what you stated in the cover letter:
"The RISC-V trace component drivers are designed to be agnostic to the underlying trace protocol hence both
RISC-V E-trace and RISC-V N-trace should work fine. The discovery of trace protocol parameters are left to
user-space trace decoder."
Since the kernel driver is intended to be protocol-agnostic, and a specific in-kernel decoder is not yet implemented
at this stage, deferring the trace protocol discovery seems to be a much better approach. Once the sysfs interface is
introduced in future patches, the user-space trace decoder can naturally query and obtain the exact trace protocol
from it. Therefore, I suggest removing this E-trace specific hardcoding from the match table to keep the driver truly
protocol-agnostic as originally designed.



