Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.190
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636851;
	b=m20Bh3IklrkB2+TMae9AMiI9uKIp2j0nzkD7kuU4a4CWM5Q/rn8kC3oWirNxWk88J0SE
	 TEWVKUUCZNPvt0JcjzrvUVFBeWluxGc+pS3yvHJg/E4zpmkRTzvW2WQkoAKkbsI4GEzcp
	 nj/MbM+/L3IICvunxhzTG+HocW5yKD9ujoLETRHK4a5x+r3zxUqirSOdDkBs+tibt+d60
	 IjnamNJYJs7rmrRRTNMHA7E2bkQ82uRoyCXuXTpmLzPoNtwfLtzh85Bd4wLuY570ZQLv/
	 IdzNLEU6zYIzrZS950YWQvcgP1dO8aYBbuYhz7PMBPFQOfKa/AIZfPep7eZ5PDSLvPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636851;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x33aGIP4APUp8gb1BvnJ3wQkOvQgGjlyZ2AiJIzqcIs=;
	b=aub8MljH3x/Q2JYqgFsLKQ3D4jXIN9YnmEDqZPzJTyPrxbNc1zDM/62OJnrj9aLh4mGG
	 n6o3zAf1lcNVL6URiy3B5mlOchoZZ+kVIXY84gfSjH0hcVy2gwUVZjPF6B+kmVzmozP3t
	 wCT5+VGwrm2O/xzsXrAqPnLzodl9S++CJ/TPJGfOojBUj5eqODkTGv/90uC/29To7FQ22
	 HyBMmlcgvoUHsrXAiJW5Q+tQMwqRCAENVPgmX0+tKRSvAm4roMbBn0HlHsyoB1dHRz79u
	 zLgdU77FzFr6W3n8k1TzMBp+pXbgk8Q+5R1bX9zChsAvdkKsea0vGtxWyunuDlmX89A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foxmail.com;
	spf=pass smtp.mailfrom=foxmail.com;
	dkim=pass header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=Qgs6zge8;
	arc=none smtp.remote-ip=203.205.221.190
Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B75C6072220;
	Mon,  2 Nov 2026 16:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B75C6072220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=Qgs6zge8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1793636841;
	bh=x33aGIP4APUp8gb1BvnJ3wQkOvQgGjlyZ2AiJIzqcIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qgs6zge8v7Px2FZwQzr88FV+qf83fUpd8PEmIOglU2hBkPq+dtHPGhes2fR9ACHJv
	 S4Duw3HXkylGq23YxTp/tsd1KCn+Uy6XCuPoceVDuxAHlKEEl9BoBTLUB66Iilzpqi
	 Y60KDicQirV93SlMx6U0pPK+NNcm5mPblMdZRDi4=
Received: from ubuntu.lan ([223.160.115.26])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 6CB21A13; Tue, 03 Nov 2026 00:27:11 +0800
X-QQ-mid: xmsmtpt1793636831t4ewg8equ
Message-ID: <tencent_9E79DCEBAC253B8EB7DE779D4180A77F7D0A@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5FnxiiewIld6jP5B/Ss9NHJF83RVmdXa0KpDn/kjqLMw8hJJwLa
	 +CA9b7T9ZdCUlUSxiWd99B1FcCwBEFAbPfos2/idmwKBVw00ZfiaPwYt/6GTf2WwFZH6pXQPJGAC
	 Qsuzqw9uABme6612AsjBOheZhf4ZYb+JB8ZiMGKY3xknNtEuuvfM/QAVM3RMY/d4FFj0KTfSGfZx
	 DTHu7qCzJYPxkOlyihV69U0E9vxstLJr9hDfDW/i3QzQQ6J2UwAQmXMubgyf2jIoomkUv0ea/x+a
	 ytd0q6OBhIO8TL6Zy/99KEyevXagQQ3FKutUsPJcB4dqKU+CCBHQEBgcoIoa+Ek0eIr/RBWgGny5
	 IZpURxsdJVMDpPdZDtxhLifo62u/6DsDBnLMdgBASVMUpG9I15arspRFyto29XrzuS+ED9GnwMvO
	 rVcbvOXlS2qe1TvE72uOZINTcGSDI1Si7+0swn9FsuqFz46lgeplY54g5M1MrtSs9nBE41aoxViw
	 M628mdAY6fvjQqGnzciVlcnLgGra0klW9A2ILx21X0uM3KmK3ppEuTge+QOivgFHgR4jmhonBmIz
	 ftM5T9l5fiIG3hdxsK1LNcNO0S8R9eQ5Wk3GNIordqu/i+WRkiNIPayoxpRO+pQatVpLUGJshTDb
	 qFMvr9CdqQW+M3KtHSlo7M1dwvXY3ZosSZH4hrcEAg91juvQpQ27nN+/AzO2Pi4BNvd3DCg52Cqv
	 GikjLkKcRnqKL3k2IBzZ5bWQewrHUxj4HM1XQWNJpNWdW124Jn6wkncDOis1CCL7dlFnl20tOQ9Z
	 VXxE4zJSlf4aQqbTl4ptsubEztn/xGos6PD1gFRVVO9tp/lmNtgUyQ/gubYu3kiZybilp1nd7v60
	 /uw19kTK/jHKgqmbk42nVbR6HZ7NYt40U7Hld8SiyGl11tdsKaTj0Xk8SkDvq12ImkgqT5OtsDfJ
	 h0RkUuT0EvRgdLLhsJ04/+xbbpvCeIJter78utEqUzpTw3vaf3CmuIuSE+oiXmRV2rFohec+VzQN
	 5o95OZFyxJ8SfLG9fckIyyefVh5c9zMNqyg5hKUZpKcQ8W4a3DYxisFdnDjSlPT1FVQEKWaI2G1r
	 EQHVJW
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Haozhen Li <dezige131@foxmail.com>
To: Dawid Wrobel <me@dawidwrobel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Sam Day <me@samcday.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haozhen Li <dezige131@foxmail.com>
Subject: Re: [RFC PATCH 0/2] firmware: qcom: scm: QSEECOM app loading and listener support
Date: Mon,  2 Nov 2026 16:27:06 +0000
X-OQ-MSGID: <20261102162706.104477-1-dezige131@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6b1853f3-4315-49cb-9b7e-83f967720a2f@dawidwrobel.com>
References: <6b1853f3-4315-49cb-9b7e-83f967720a2f@dawidwrobel.com>
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

Hi Dawid,

I owe you a sincere apology. I should have reached out and coordinated
with you before sending anything based on your work, asked for your
Co-developed-by: and Signed-off-by: tags, and verified the origin
properly. I am truly sorry for stepping on your toes and mishandling
the attribution.

For context, and not as an excuse: my sole goal with this series was
to bring up the fingerprint sensor on my device (huawei,gaokun3 /
sc8280xp), and the codebase I started from was Sam's snapshot [1].
During that process I made the mistake of relying on an AI assistant
for the porting and background research, and failed to verify that it
had traced the upstream lineage back to your active qcom-qseecom-tee
branch. Consequently, my cover letter's claim of "adapted to modern
mainline interfaces" was written relative to Sam's older snapshot and,
as you rightfully pointed out, is simply incorrect regarding your
repository. The core architecture and design, such as the listener
loop and its iteration bounds, are entirely your work, and the
attribution in my RFC fell far short of proper DCO standards.

I am withdrawing this series immediately. Your tee: qseecom driver,
with the Goodix sensor driver on top, is exactly the complete in-tree
consumer Konrad asked for, and your upcoming RFC is unquestionably the
right vehicle to bring this infrastructure to mainline.

I would be honored to contribute back to your tree, entirely at your
discretion:

 - A PR adding defensive checks for image and listener shared buffers
   above the 4 GiB physical mark, using the overflow-safe comparison
   Konrad suggested [2]. For what it is worth, I probed this on
   sc8280xp by OR-ing bit 32 into an otherwise valid image address:
   the firmware rejected the APP_START call with an explicit error
   rather than silently truncating the address, so this is strictly
   defensive hardening, not a fix for a universal firmware defect.

 - Testing on different silicon: I have exercised this transport on
   sc8280xp with a FocalTech fingerprint TA through repeated
   load/shutdown cycles and enroll/verify transactions, and would
   gladly run your tree on this hardware before you file your RFC and
   provide a Tested-by.

On the userspace side, I also maintain an independent D-Bus daemon
implementing net.reactivated.Fprint directly, without patching fprintd
or libfprint. Happy to compare notes if that is ever a useful data
point for the wider fingerprint ecosystem.

Thank you for your candid feedback, for CC-ing Sam, and above all for
the groundwork that made my device bring-up possible in the first
place.

Best regards,
Haozhen Li

[1] https://github.com/samcday/linux
    branch codex/sargo-fingerprint-kernel11-baseline
[2] Konrad's reply on the patch 1 thread

