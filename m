Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B5223A99F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789622185; cv=none; b=VL82dueJ+oolOyiUe+jux/rBCwQXl92FD8jG/wxYbSSQA5AERApNoIE0qEr2szemNy42pQh/6my3Y3IhbxhZOk8q7Q5G8odS/M+gBr9J5y1pARRbVDT/HmXmUDQNcDSNRHRkRYgBVgNTytQSukvXE2M2ryhWBwCEanlRb1WmHCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789622185; c=relaxed/simple;
	bh=BHDZ37MO6RfHSXbpGXKSejXd67tXHEmdqiQ/26TShFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UECypxPM06ktsRKme5qLs9GHc9Wnake3gHA7RqZF0SEGx5Q1dxeeIfxBG0jaEQU35kxF2MAzrUH19GsZyqIWRDVcWScB+rfsigKfa4tqAWCEvy3vAbVZ/BxQTbeDjlDwqiVmTsdqA+9IswVDywcYcqYGenisexHakI7CohBhcI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XtiMiWiI; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XtiMiWiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Gf
	r3l5F8HnBKHnFxMcGkWmdrLQLboxtdhKHcpk7gaeo=; b=XtiMiWiI3lHxWXAwfF
	vWn4zQGeUQnGZlPKnVXLJPDhp7uVUBPWac6U6Hkegs8IXYcIN0KyTNi1BRzR+ebP
	fBGd88+Q/bhA7VHSILmEVKD2m6tvco2JZL20nHVbuOERAW0COapzJxR4/xU0cCDu
	8c5TD0cG4R8LB/VPhKXwPObRE=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3X8eLd6tqAQr0BA--.46442S2;
	Thu, 17 Sep 2026 13:15:56 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	linux-kernel@vger.kernel.org,
	syzbot+37ca7ae3e98cb65c3209@syzkaller.appspotmail.com
Subject: Re: [PATCH] kthread: Report cpumask allocation failure without warning
Date: Thu, 17 Sep 2026 13:15:55 +0800
Message-ID: <20260917051555.281556-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <B6BD0B30-6E75-49ED-A13D-33FED28AD032@mainlining.org>
References: <20260914120941.63968-2-quchaosheng000406@163.com> <deab3ef5-e63f-474f-9a1b-fb4f4b65be2a@redhat.com> <aqkhrxXXIm43mqfs@localhost.localdomain> <20260916015948.113062-1-quchaosheng000406@163.com> <B6BD0B30-6E75-49ED-A13D-33FED28AD032@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X8eLd6tqAQr0BA--.46442S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF47tr1rJFWrKF1kZw1DWrg_yoW8Aw45pa
	95tw1jkwnayr10yw1jyF4I934Fkws5AF45Jry3Wryjvwn0gF12kFWUK3yjqryDW34Ig3Wj
	vFnxWryDCw4rAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U8b15UUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC-wyG+2qrd4wlbgAA3-

Hi Bradley,

Thanks for the review.

On the AI question, since you asked directly: yes. I used an AI coding
assistant while preparing this, including the comment and the changelog. I
reviewed the change and tested it myself, but per
Documentation/process/coding-assistants.rst the submission should have carried
an "Assisted-by: LLM ..." tag and it did not. That is my mistake and I will add
the tag on any future revision.

On the NAK itself, I would like to answer your "what effect does this make
(except from the message)" question, because there is more to it than the text.

WARN_ON_ONCE(1) is not only a message. __warn() taints the kernel with
TAINT_WARN, prints modules and dumps the stack, and calls
check_panic_on_warn() (kernel/panic.c). So on any kernel running with
panic_on_warn=1, a failed GFP_KERNEL allocation in the thread creation path
becomes a full panic. That is the harm: the allocation failure is recoverable,
but the WARN reports it as a kernel bug, taints the box and can take it down.
pr_warn_once() keeps the report and drops the taint and the panic.

You also wrote on 14 September:

    Perhaps you could warn -> info? Because people may prefer to know if it's
    broken.

which I read as the same direction. I kept pr_warn_once() rather than
pr_info() so the line still stands out in the log.

On "under memory pressure you get what you get" and "fault injection is just a
test": I agree with both. Nothing is going to work well at that point. My only
argument for changing the severity is the taint/panic consequence above, not
the message length.

You said on 14 September that you were not comfortable taking a position until
the maintainers had input. Frederic wrote this code and has already commented
on the thread, so I am happy to leave the call to him.

Thanks,
Quchaosheng

