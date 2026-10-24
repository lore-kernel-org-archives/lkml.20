Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792843162;
	b=TzRCXSl6i6us+X24qyBOlzNP9ob/DaSdzZK860rlFInI4iQ0o6AfmR4yYLfHTs/EY+Qm
	 42HuAmr/txsY5loFCti0p2fO9NTR1P9BxB5RkWwtJ2O9edn9Iwhmk5lpvCkKClEj41enE
	 CvhIoVEGw/pXiBFT3GKN2DVKnA36j/tnYsKOE768vKQRzKGsbl8bjQbl+gnJixrh/ZBCq
	 ahCJhyZDrO32nhXQOdb6UT+zS/NeSi8k4rObJSulOROsP3RV0gFnUrgQc8ye1dUGJRQPk
	 Pwf88NXUyYvp/hu/GzM9Ko45ZPQxaN379Djh0yf/ZQ2puEW4wrUfFvsEPViJtp/Pvyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792843162;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Sl0pastrMoO2mqU9TvPqSN7HCV9lSluHQxtVtSfTL2c=;
	b=aTIYRZW2+pKJfRMz+aMgDJ96q2eniiLURdybxOGIlv0ZXq0R4TdD9z4lsJvilK58dFjC
	 k/thfL4npoDOrtH8NuQitOLcuGkEkbFYMS/CtvEdzfGyVeTHADBbqOYTt+PDUTl4TjPzI
	 L72yeTJwWmsF6LFI4Mk3bJbBxo9V6LpEaV3e//hUy49zMCHUs4HflJQ+g1IqHtdlkRvRH
	 G0oAR6QFqrzVQPtVFiVidspQl38qJUB08zSPop4PaTTDdWaATVr8qtDQicPIqksq5GhjN
	 mwjAWYJwwYxU6SgCALt/o9t3/Tk6oq6AICvxQEQpaWo3Wkz7A7yU08TMYGH0nJELmlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=UbOpBiC1;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=T79m+lJr;
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB61606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB61606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=UbOpBiC1;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=T79m+lJr
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 5FCBD1D000CC
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:59:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sat, 24 Oct 2026 07:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1792843160; x=1792929560; bh=Sl0pastrMoO2mqU9TvPqS
	N7HCV9lSluHQxtVtSfTL2c=; b=UbOpBiC13OKUhqbVC6wcrTCxE+dEu2SP5IEuM
	hYwrFWEafA05cPgGA+pVci1IcpwKK+IT7/B03NOrVjiGBgD5fdITTUDcGy9fblfz
	ODzqpo7xqKEnVl0dx5Ss6gwSMLuZx5Y3nKe3BBcyXGimFP9kwBnzOqK7ZzAdsqmM
	ZATcOBjEF0OXPHom9Gl5eA6rOKZQwtSgEfQhp3QR6IdCUXPotUPDnRFLGUgdvpVw
	/P6XcR3Zagwrs6nExkdv59rNfaDiBVmCgpfx7wDDVFbQpxwZYAAQM+gEtuiJUxO6
	B88rDPMuhL73iOlP0Q8lkFnRlBYTJTZRSnADp+HC4+HzmO+VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792843160; x=
	1792929560; bh=Sl0pastrMoO2mqU9TvPqSN7HCV9lSluHQxtVtSfTL2c=; b=T
	79m+lJrYohekLACmU1T88b2uGAqsf+seM0mBUO/FwTLeYDYjD74prHvoOxJU5ZE8
	+ZgT8d0ExuURlXpMNiqTQEkJTh3YVO9oYZOCXdKkecxcFpEp2/fffF3YWZOXe1h8
	4mp0T4rJLakd+upRE4PLgvnvELXFwk6KFKVXAGEGASwxOaaqgUM2esydjdBiZsoC
	dNosPOVlLdo0W00OsasephnbsX6W2pO6wqrE1d3ptHt4+KG5gmdMEOQtY2Wv8l91
	tv0xW2eTRmikWAtW8eP6bYsdfmd+Cgd86ikFPCMP1Ar2TXOu8P0LtJZ8haCLUgsm
	EyNvOY7ax8fnyjJpNPlFw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792843160; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:CtaB73vUDuu22+PRj/WgzeXKSwW8Dwggc5A0srKjnKTV0pl
	vVoIXKvVxX98duol4DWtNZA0/Sj8go9Snqkh70bXTs1GuugYR3tBBsqKzTJrPePw
	1qHgYMoIs6bpZpWZdE11DLJHxADHxvn10b8CrqrzYqWkF3Qlxji+7HM+ka1do56a
	wd92ukOlm6pzsVgxbvK5XMakkOFKRNj0FWrxI1ZCcvUemyOIZbih7b5o4RAhbebZ
	/nQHjjGiuIr1uydVCXBKQSpgYmaaD9Od3XHISQeT86jEtCOy1ut2I64q1PaeBURF
	zfj6QfLoNJwXG4uYV/RvnGg0BoWH/asc6KiJrCA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	mail-followup-to,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:2WjPrQGKX/Qh7YUD0wrE4xdZ+OOHVyQJr+4DXne3dt8=:Z3elLSZKYGaNv0sEBZjY3VEcRLmmEzZFsNtG8ENmMxQ=;
X-ME-Sender: <xms:l53cavHjpnWymbkHOYhXI-4yggw1zpOKKp6RwBuyeWisxcU8DzTPIg>
    <xme:l53cakEX0BFjBSnAHew1FzMOts9Cvf3uO-UGG4uF8M25ycmi1JFQcUEjQBcc3XtVe
    wl58WktkkOVhChfnCkMNFT3NVo1iDdYPJ0q0kE-VtOW6MSyPZPPk44E>
X-ME-Received: <xmr:l53cakPIy8LcO4DigGOosi06L0eHr22IzNeugcLcF5EkoQTeKg-rw2mCP9xmZAKGbjGCTTsp0Pr2v5sYSx_5YvCD425hYQY>
X-ME-Proxy-Cause: dmFkZTFLjmUgnZfekOO1/T73eMoDSadquJIGAtdDGsMKv7BM3Ny72Ig1zNT45nsKd0t/m9
    nua2HZv+mRC0XhX7NhwJfSYTyp7X53cCQsdG4N445BbBhzrP7+bkdkOdPB++hNHxDZMxUn
    L6y1dKt1U3LdXcJXK+hPh2EEeUcuIU1fm07XYvazhXzEBoZzMQJ0BlT/cIQgRZdgSpbYkI
    f03b6dnhtfL8adK5PTqa0ME/A35NfWdpmwtl0Etg6zLYKJvhF2MceeoVYo1BZC4g9r/cEG
    xVRWpRZtllhPQ3F/r8Z2UEJVHeVYYgyy4OT0wj1uZTAn73NcLnR2UYX9UY8HELxftXfUNZ
    PQ6X7Hjrvh+LUuYbEcfGjv7iRVF2qvKEaeX6WG2ikLoILOgdeh4Ds/0phC8wgKvXpeK/lN
    I8XQyWrwUGi07kpIwfz9eqR8Quxbf+npILLzQ338QbI52lqbgpUzxajv+e1VdMHLcpsj6d
    OGH6L/gbqLxgin0+Z1a2I5FcFgO6eAdyAE5KRSlh3/fwocwIOD86A/IgBA7sksdwvbkpTv
    hNzrLCn3UMdtUIBd2FXWqoBg8Er48S+Tk5rFlYCgwwjzbgrpX0s9gbDCH19GPMByFJArTC
    ftfupOUWjgfT9wKf55Ptf+8nEbNx/jBLLQza/FcsgEQIYoKCj+T4Yv+4jhsg
X-ME-Proxy: <xmx:l53carH3BcnQaugkUUCnhhYw9w4Vm3LucHNUKV7yljb7aCLu4W12Zw>
    <xmx:l53cajOGEjcF8UITDbLd4S8LQKctJ5YSbGR0p3BF3nKfCfW6FL7p3w>
    <xmx:l53cak-2p2se_PsrMVn41_LaJY_x3oGMiSIiEXhnhE3TIAeLpb45Fw>
    <xmx:l53canSn8YRBddUQDXJWFXgTkd6jdiaHWjwMqcVN4ytBfmzHd1TxHw>
    <xmx:mJ3capQQO2a19vQCWjyq3otNxQHpU4PB3hj0hXxUD4jEgksQCetDq56n>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 Oct 2026 07:59:18 -0400 (EDT)
Date: Sat, 24 Oct 2026 20:59:15 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net
Subject: [GIT PULL] firewire updates for v7.4
Message-ID: <20261024115915.GA518900@sakamocchi.jp>
Mail-Followup-To: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net
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

Hi Linus,

Please pull firewire changes for 7.4 to your tree.

Highlights:
- Guarantee asynchronous packet and transaction callbacks in process context
- Fill kerneldoc for transaction layer
- Enable compiler-based context analysis for the transaction layer
- Fix a reference count leak in the cdev layer
- Add KUnit tests for the configuration ROM parser and generator
- Misc fixes for kerneldoc and nosy-dump application


Regards


The following changes since commit c03c1a14507dfaf8b856c2608f9ac216021fc222:

  Linux 7.3 (2026-10-18 13:14:58 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-updates-7.4

for you to fetch changes up to 06d410ba93d33a6c78e917d54e821355492e3ce4:

  firewire: core: replace drain_workqueue() with flush_workqueue() (2026-10-19 21:25:55 +0900)

----------------------------------------------------------------
firewire updates for v7.4

- Guarantee asynchronous packet and transaction callbacks in process context
Both the 1394 OHCI driver and the core transaction layer have been changed
to guarantee that asynchronous packet and transaction callbacks are
invoked in process context. In v6.17, the execution context depended on
the transaction destination: callbacks for transactions destined for
remote nodes were invoked from a workqueue, whereas callbacks for
transactions destined for the local node or terminated due to internal
errors were invoked in the transaction initiator's context. All such
callbacks are now guaranteed to execute in process context, eliminating
the need to account for different execution contexts when implementing
callback functions.

- Fill kerneldoc for transaction layer
The above change guarantees a consistent execution context for packet and
transaction callbacks, making it possible to document their execution
context in kerneldoc.

- Enable compiler-based context analysis for the transaction layer
The core transaction layer is sufficiently complex that compiler-based
context analysis can help detect invalid call paths.

- Fix a reference count leak in the cdev layer
A reference count leak was reported when a user space application
delegated isochronous resource management. This issue has now been fixed.

- Add KUnit tests for the configuration ROM parser and generator
In recent years, questions have been raised about how the configuration
ROM parser and generator handle boundary conditions and edge cases. KUnit
tests have been added to verify their behavior in these situations.
KUNIT_STATIC_STUB_REDIRECT is used to stub the transaction responder so
that it returns the configuration ROM contents.

- Misc fixes for kerneldoc and nosy-dump application

----------------------------------------------------------------
Bill Wendling (2):
      firewire: core: add __counted_by_ptr to struct fw_packet
      firewire: core: add __counted_by_ptr attribute to struct fw_device

Karl Mehltretter (1):
      firewire: cdev: Fix FW_CDEV_IOC_CREATE_ISO_CONTEXT references in kernel-doc

Takashi Sakamoto (82):
      firewire: core: fix wrong git hash in code comment
      firewire: core: fix wrong git hash in code comment
      firewire: core: add KUnit test skeleton for config ROM parser and generator
      firewire: core: add test to detect irm-is-1394-1995-only quirk in config ROM parser
      firewire: core: add test to detect irm-ignores-bus-manager quirk in config ROM parser
      firewire: core: add test to detect ack-packet-with-invalid-pending-code quirk in config ROM parser
      firewire: core: add test to detect unstable-at-s400 quirk in config ROM parser
      firewire: core: add test to avoid excessive configuration ROM length
      firewire: core: add test for root directory generation in config ROM generator
      firewire: core: add test to generate with AV/C unit in config ROM generator
      firewire: core: add test to generate with IIDC unit in config ROM generator
      firewire: core: add test to generate with both AV/C and IIDC units in config ROM generator
      firewire: core: add test for invalid length in config ROM generator
      firewire: core: add invalid block test for config ROM generator
      firewire: core: add test for beyond-boundary case in config ROM generator
      firewire: core: fix source bus ID detection for AT context in big-endian systems
      firewire: core: fix type of hard-coded image in config ROM generator test
      firewire: core: fix type of transaction data in config ROM parser test
      firewire: core: remove unused link field in fw_packet structure
      firewire: ohci: obsolete flushing field in at_context structure
      firewire: ohci: use in_range() macro to detect CSR address ranges
      firewire: ohci: add helper function to detect local AT request/response packets
      firewire: ohci: refactor multiple calls to fw_fill_response()
      firewire: ohci: refactor local response packet handling
      firewire: ohci: refactor handling of local AT request/response packets
      firewire: core: correct comment about execution context
      firewire: ohci: use workqueue to handle error case of AT request/response packet queueing
      firewire: ohci: use workqueue to handle local AT request/response packets
      firewire: ohci: refactor branches in at_context_transmit()
      firewire: core: use spinlock without irqsave for card split_timeout member
      firewire: core: use spinlock without irqsave for card topology_map member
      firewire: cdev: use memory barrier to access fw_device members
      firewire: cdev: refactor using scoped_guard() for get_info ioctl call
      firewire: cdev: refactor copy_to_user() in get_info ioctl call
      firewire: cdev: add annotations and comments about race condition of bus_reset_closure
      firewire: cdev: add KUnit test for bus reset event UAPI structure
      firewire: core: consolidate lock scopes for event waiting in dequeue function
      firewire: core: fulfill kerneldoc for address handler
      firewire: cdev: use mutex for phy receiver list
      firewire: cdev: use GFP_KERNEL in address handler
      firewire: cdev: refactor add_client_resource() to drop GFP flags argument
      firewire: cdev: refactor add_client_resource() to have release callback function
      firewire: core: refactor invoking transaction callback
      firewire: core: use workqueue to invoke transaction callback in some error cases
      firewire: core: update kerneldoc for fw_send_request() and its variants
      firewire: cdev: hold client reference for fw_iso_resource_auto lifetime
      firewire: cdev: fix client refcount leak in iso_resource_auto_work()
      firewire: cdev: remove unnecessary client locking for fw_device members
      firewire: cdev: wake up client from queue_event() only when any event is available
      firewire: cdev: use xchg() to exchange pointer value
      firewire: cdev: refactor event copying to remove goto statement
      firewire: core: remove unnecessary branch for timestamping when cancelling transaction request packets
      firewire: ohci: run work immediately when re-enabled in packet cancellation
      firewire: cdev: use atomic_t for iso_resource_auto todo member
      firewire: cdev: use mutex for client locking
      firewire: core: use kzalloc_flex() to allocate structure with quadlet array
      firewire: cdev: use kzalloc_flex() to allocate structure with quadlet array
      firewire: cdev: use kzalloc_flex() to allocate structure with byte array
      firewire: core: expand close_transaction() into its callers and remove it
      firewire: ohci: schedule callback on workqueue when cancelling AT request packet
      firewire: ohci: allow AT local packet cancellation
      firewire: core: schedule callback when cancelling pending transactions
      firewire: core: fulfill kerneldoc for fw_cancel_transaction()
      firewire: core: add might_sleep() checks to transaction layer
      firewire: core: enable context analysis for transaction layer
      firewire: core: use context analysis annotations and lockdep checks for transactions lock
      firewire: core: use context analysis annotations and lockdep checks for split timeout lock
      firewire: core: use context analysis annotations and lockdep checks for topology map lock
      firewire: core: narrow the card lock scope when accessing node_id
      firewire: core: use appropriate spinlock variants for transaction-related locks
      firewire: core: add kerneldoc for outbound transaction-related symbols
      firewire: core: add kerneldoc for inbound transaction-related symbols
      firewire: core: use release/acquire pair when replacing underlying driver on card removal
      firewire: core: don't disable error work for transaction
      firewire: core: reuse helper function for scheduling error callbacks
      firewire: core: use workqueue to cancel all pending transactions on card removal
      firewire: core: check precondition when scheduling error callbacks
      firewire: core: use context analysis to check lock state when scheduling error callbacks
      firewire: core: use designated initializer for dummy driver on card removal
      firewire: core: invoke packet callback from workqueue when removing card instance
      firewire: core: adjust context_unsafe() usage for lockdep checks
      firewire: core: replace drain_workqueue() with flush_workqueue()

Triet Hoang (1):
      firewire: ohci: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

longlong yan (2):
      tools/firewire: nosy-dump: guard close(fd) when reading from input file
      tools/firewire: nosy-dump: fix input file handle leak

 Documentation/driver-api/firewire.rst        |   5 +
 drivers/firewire/.kunitconfig                |   1 +
 drivers/firewire/Kconfig                     |  16 ++
 drivers/firewire/Makefile                    |   2 +
 drivers/firewire/config-rom-generator-test.c | 407 ++++++++++++++++++++++++++
 drivers/firewire/config-rom-parser-test.c    | 355 +++++++++++++++++++++++
 drivers/firewire/core-card.c                 | 124 +++++---
 drivers/firewire/core-cdev.c                 | 301 +++++++++----------
 drivers/firewire/core-device.c               |  12 +-
 drivers/firewire/core-iso.c                  |  32 ++-
 drivers/firewire/core-topology.c             |   3 +
 drivers/firewire/core-transaction.c          | 414 +++++++++++++++------------
 drivers/firewire/device-attribute-test.c     |   4 +-
 drivers/firewire/ohci-serdes-test.c          |   4 +-
 drivers/firewire/ohci.c                      | 312 +++++++++++++-------
 drivers/firewire/ohci.h                      |   2 +-
 drivers/firewire/uapi-test.c                 |  20 ++
 include/linux/firewire.h                     | 153 ++++++++--
 include/uapi/linux/firewire-cdev.h           |   4 +-
 tools/firewire/nosy-dump.c                   |  10 +-
 20 files changed, 1655 insertions(+), 526 deletions(-)
 create mode 100644 drivers/firewire/config-rom-generator-test.c
 create mode 100644 drivers/firewire/config-rom-parser-test.c
