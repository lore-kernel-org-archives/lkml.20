Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD6F2EBBA1
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928277; cv=none; b=ZVxRfqwALFNS7TGASmhQo9bIslVdyv53NJP7zMGTaF7AwBinFVTqZMsGcC4/4wbCdhbFDN2Y/fVxyEF2/32lqhAJrvW+i/s7DD/72SPPLVuv7tWNlDRbdCakmRyJ70N3xTQ9Y9QjOCz8uJFunUvjBsE/BJ2Tg4cZzu3iB3IJeRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928277; c=relaxed/simple;
	bh=OwvzYqkwhaHes4+aK1zzj8QFdyVQ8grtIBJDfwQ60Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e3TC8SfBICWO3eYCMwUdTCAsSh+HxW2mKhTEOjadxfNpvodToZPNuwXCPkwj1DAtweN8ablHWUm86KyKh8MNwDdogYLT8r4XwlMaJz2TfvwF3RVHBa0ChtRCGNHbYmoH9nZ+atVBGCJaAjC/fzuvYHbgmzQV4TEp202G3StH7/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmGyyz56; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmGyyz56"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED67E1F000FF;
	Fri,  2 Oct 2026 08:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790928271;
	bh=P7GQ3Wny2G3hGvg66ZzEFWU9/Nt6DMywTTL6lfbgK4s=;
	h=Date:From:To:Cc:Subject;
	b=fmGyyz56DBNm0p/UGwihjav+ERWCpQgcvcozd+VfjiR2GVaBGUCJ32w/ySR4BfkNN
	 rNcr499/i3C13CdqUqDmfBEBqSSo9dYm+F1uBkWKohmtodK0/EcbLiPKO413yDemic
	 DyAmxvsDMHBqhEvoeyx28Zm6IlK5voXkbmj4j+MjN0gMIZrErQhyxQtbxS/EO/JvTM
	 rA2skQFVmD4sxSWZwnJv50XTAXVKiCH+MG12DrJWebR+PYjJoB+RiwpwHYBI6g0qfv
	 XmR3Ldl1RvSIfstODZE0dElVytLOQSY9WVxg631wV0e9fpOOPJGOwNNsFvMJJY0J/6
	 f2d7UBM1A9FPQ==
Date: Fri, 2 Oct 2026 10:04:27 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] HID fixes for 7.3
Message-ID: <ar9lU7uxSwvV57e9@beelink>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Linus,

please pull from

  git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2026100201

to receive HID subsystem fixes for 7.3, namely:

=====
- Revert of the Bolt integration into hid-logitech-dj (Benjamin Tissoires)
- A couple of buffer overflow in Intel-thc-hid (Even Xu)
- A couple of Sashiko findings fixes in hid-multitouch and HID-BPF (Aldo
  Ariel Panzardo and Benjamin Tissoires)
=====

Thanks.

----------------------------------------------------------------
Aldo Ariel Panzardo (1):
      HID: multitouch: stop the release timer from being rearmed on remove

Benjamin Tissoires (3):
      Revert "HID: logitech: add Bolt receiver support for Logitech HID++ devices"
      HID: bpf: cast size to ssize_t when checking hid_bpf_hw_request
      selftest/hid: add test for negative return codes for hid_bpf_hw_request

Even Xu (2):
      HID: Intel-thc-hid: Intel-quicki2c: Fix buffer overflow
      HID: Intel-thc-hid: Intel-quickspi: Fix buffer overflow

Tomasz Pakuła (1):
      HID: universal-pidff: Add support for Turtle Beach VelocityOne Race

 drivers/hid/bpf/hid_bpf_dispatch.c                 |  2 +-
 drivers/hid/hid-ids.h                              |  3 ++
 drivers/hid/hid-logitech-dj.c                      | 48 ++------------------
 drivers/hid/hid-logitech-hidpp.c                   | 51 ++--------------------
 drivers/hid/hid-multitouch.c                       |  2 +-
 drivers/hid/hid-universal-pidff.c                  |  1 +
 .../intel-thc-hid/intel-quicki2c/pci-quicki2c.c    |  6 ++-
 .../intel-thc-hid/intel-quickspi/pci-quickspi.c    |  3 +-
 tools/testing/selftests/hid/hid_bpf.c              | 31 +++++++++++++
 9 files changed, 51 insertions(+), 96 deletions(-)
--

Cheers,
Benjamin
