Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794128961;
	b=jCge7AAa+b++RW1h+uSibaintNSwPPTIXBayT69EB5DEIKfajReVIi31XCubYY+i2VUX
	 rRsp3I2/UMzE48zqpu62bPqx1xANYIhH6SxlmrDRldTXzmOfnVnzxfc4/J3wEjuyJvCXj
	 yiZffCBJW13H8cWdFHvU2AQOFkvIBzMpQapEYVuLH8F/xiqMIHAx2rCK4ynIxBBlPtflz
	 oTRy8cNJJ/dbOQODjX3vHWl34iBpaxd8TOXM66FNE+Y18Lw31o6/ycGhIe/e/5OMsuQ5/
	 SsO1QL5QI0HHH5/c+A7At2Bg1HEEbM8g3pj7KgDPXzUuK/mEiHqUu8wDhNqBK0PIp1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794128961;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Xcd1+3baLN6VoVgWfgBnLAvl1nQe7NkeVz0LTjesNTw=;
	b=gHhRDavIp8gg4fe7RIFLQ2bzhetr2NPoaout8KzCTK1Akv8BsHOx9WlbKonD4vPfPWJf
	 Ht/MgDTjPKfm79+/QxETJBp+IBUmPmCo6kQJeXE+9xpmzyhtQOWh1K70syvkgXiROfSJk
	 N8y7AeAkdl6N6LFV4EigRsHz9O+0bMOja/H9Bu25b2hnOfU6H/gkPBZWIXBp7HJdSf6fT
	 5/y32CB2e8LcLfI2bkDuw+mck9L/UGGs+PUDPUAFT9fyqo8LMKHa1PMuPOYtseaXZsyKw
	 bRnbOQhFQfW0zYLbK9vVNNwk2PxrObNu+QigaC9PzlTPJax4cJpIBhxlduKV+NEbZSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=geYn4RmD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD64E606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=geYn4RmD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663D51F0089F;
	Sun,  8 Nov 2026 09:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794128960;
	bh=Xcd1+3baLN6VoVgWfgBnLAvl1nQe7NkeVz0LTjesNTw=;
	h=Date:From:To:Cc:Subject;
	b=geYn4RmDABwk0jtQuRpYizxOzoWGxZCdmbjiu0QBekF+7O8dBI+tdxkwA2VbQ/lcb
	 9qQt+z5GNrEjHYVZOs1GtPjUDu13mA72SwIgIuvbFUgu4rMLgWAasa0kWiU3ksA1KU
	 3Vxi7tg6Sm5BZTw46CJNSu7AgWZeaVtNJeB1Vbto6y5tlRbjlHxgclh5nSLz3cWPya
	 osiPu8LE4kO+usbeFblywJo5tDq2gLWKnHhhFr4wvfydBvUQdYIdTWwyI2Wu6p8XfW
	 S5/sq0ZT4xt/zN02CEKX8AwhNWfrv3YUfUJgsOX9ansBf7ACxZ9cc4XiOouvE/43ni
	 wU80j0dh48FeA==
Date: Sun, 8 Nov 2026 10:09:15 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>
Subject: [GIT PULL] perf events fixes
Message-ID: <avA8O8tiG0pLpMKn@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest perf/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-11-08

for you to fetch changes up to 6f083fbccd5f06889bc08e1182bd02c0383b9121:

Perf events fixes:

 - Fix sideband event output when only requesting attr.defer_output
   (Ian Rogers)

 - Clamp deferred callchain entry count to fit u16 header.size
   (Ian Rogers)

 - Various AMD IBS fixes (Ravi Bangoria):
    - Reset CPU0 IBS state on syscore resume
    - Fix kernel address leak via REGS_USER and REGS_INTR
    - Simplify/fix event state handling with IBS_CAPS_DIS

 - Revert AUX page allocation order default to be continuous (Leo Yan)

 - Don't send SIGTRAP after exec removed the event (Danish Khateeb)

 Thanks,

	Ingo

------------------>
Danish Khateeb (1):
      perf/core: Don't send SIGTRAP after exec removed the event

Ian Rogers (2):
      perf/core: Include perf_event_attr::defer_output in is_sb_event() check
      perf/core: Clamp deferred callchain entry count to fit u16 header.size

Leo Yan (1):
      Revert "perf/aux: Allocate non-contiguous AUX pages by default"

Ravi Bangoria (3):
      perf/amd/ibs: Reset CPU0 IBS state on syscore resume
      perf/amd/ibs: Fix kernel address leak via REGS_USER and REGS_INTR
      perf/amd/ibs: Simplify event state handling with IBS_CAPS_DIS


 arch/x86/events/amd/ibs.c   | 197 ++++++++++++++++++++++++++++++++++++++------
 arch/x86/events/intel/pt.c  |   2 -
 include/linux/perf_event.h  |  11 ++-
 kernel/events/core.c        |  37 ++++++---
 kernel/events/ring_buffer.c |  29 ++-----
 5 files changed, 216 insertions(+), 60 deletions(-)
