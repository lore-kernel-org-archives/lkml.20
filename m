Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FBB3BD24A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537163; cv=none; b=OftT1vQicj/7trJwug4oUWTlcWlxMYPPn+IxMCAacUpBnje88x1FfIfc6oFSHA1+csu9MC3EG7tJidA0eQzPK5gFaFW8Q/j62R/PEqin64zC8Cqs6JPpNmsep8WltXSlQquhMFeFzOGwjfZQMUKXtwhrSWjiHxXqXx3Y3MqM0uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537163; c=relaxed/simple;
	bh=TU1qUZaFGd7USw0Ok8RypbmAZcdr3tICy5E+lxR7Inc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nFJMFSaLvOmY61WavhiewLt8M7p2I2N2eIH2IT6GpwZ+qoObiUDwVVzW0dACwDRr4IP33Fz+i7CaH9VaDxEQqY5FntqyXh19uktyIrJaDFP8EuAVM+WZSRkp+3GpE6caoaHbnxLz7zmvUkJfoblQsSKGF23uSFtIxF3nuPgQyUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBJjJ6W7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBJjJ6W7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE3B1F00A3D;
	Fri,  4 Sep 2026 15:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537161;
	bh=eN9Y+FsL5LiXNh16jE1OUMvMOSP3IdqUMRPML9OtA5o=;
	h=Date:From:To:Cc:Subject;
	b=FBJjJ6W7xR5GlsHwtIatlBXugwnracZb8qhZPbdDZuMhuAJqav9MStGssnd9Mp8fl
	 PumlouhbMFvddqalmP85XIDM+B3m4c9++KXDUpXpPlJ5sW9qp+EquSigsd+mLAkvS6
	 1tcvKm12IGIW1OP2CT0/lGkzwOBc7T5AsNiJi0crpkTPwRQGQV9mKTIsP8s4mqHgMt
	 q1VnMiqSj5FPK+TkIq+/OUnAw8KsqopHaRIiazcyuK/bc/DlnYKDLJeYAiUqT7r7fk
	 LHziRVHZAl5w0JPWY4hoCsogbCD1WCwVz5/8/CRaEHfKWsNNaO8HYz1vSkEr9DTPgi
	 w2zRrMYwlwcyg==
Date: Fri, 4 Sep 2026 17:52:37 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] HID fixes for 7.3
Message-ID: <aprpMAFuY6lRnT9z@beelink>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

please pull from

  git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2026090401

to receive HID subsystem fixes for 7.3, namely:

=====
- hid-hyperv build fixes on certain configs (Jiri Kosina)
- HID-BPF fix and selftests now that the bpf verifier is more
  restrictive (Benjamin Tissoires)
- Some AI detected fixes for OOB, errors and validation (Ibrahim
  Hashimov, Shen Yongchao, Wei Jie Law)
- various device fixes (Dave Carey and Vadim Klishko)
=====

Thanks.

----------------------------------------------------------------
Benjamin Tissoires (3):
      HID: bpf: mark struct hid_device as safe BPF pointer
      selftests/hid: Add a test to ensure we can write fields in hid_device
      selftests/hid: prepare test_rdesc_fixup_get_data_overflow for the new verifier

Dave Carey (1):
      HID: multitouch: Fix stale MT slots when contact count drops to zero

Ibrahim Hashimov (1):
      HID: wacom: validate report length in wacom_intuos_pro2_bt_irq

Jiri Kosina (2):
      HID: hyperv: fix build breakage with certain configs
      HID: hyperv: make pointer arithmetics understandable for FORTIFY_SOURCE

Shen Yongchao (1):
      HID: bpf: serialize device reference release in struct_ops destroy path

Vadim Klishko (1):
      HID: i2c-hid: Add a quirk for a Cirque I2C device.

Wei Jie Law (1):
      HID: rmi: fix OOB access with undersized RMI reports

 drivers/hid/Kconfig                                |  2 +-
 drivers/hid/bpf/hid_bpf_struct_ops.c               | 23 ++++++++--
 drivers/hid/hid-hyperv.c                           |  4 +-
 drivers/hid/hid-ids.h                              |  1 +
 drivers/hid/hid-multitouch.c                       | 19 ++++----
 drivers/hid/hid-rmi.c                              | 46 +++++++++++++++++--
 drivers/hid/i2c-hid/i2c-hid-core.c                 |  2 +
 drivers/hid/wacom_wac.c                            | 13 ++++++
 tools/testing/selftests/hid/hid_bpf.c              | 51 ++++++++++++++++++----
 tools/testing/selftests/hid/progs/hid.c            | 26 +++++++++++
 .../testing/selftests/hid/progs/hid_bpf_helpers.h  |  3 ++
 11 files changed, 161 insertions(+), 29 deletions(-)
--

Cheers,
Benjamin
