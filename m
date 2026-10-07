Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAFD3C819C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791408938; cv=none; b=BE6xGaQoL2PbLXzbCU+ipMH8RFTc9VbP2oELwdOS3nL8Zp1z6JnM/xKPgbSXWqZKGKIQUFU9wgYZVkrm7l1xQQNbsqWE8SKy3nY4n0wN/xp7w/cbQizIzJlnnzDS38qaEukVR6f3XMYofoFD8ZBkMFeASufM6yGQC/og6Bh6WVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791408938; c=relaxed/simple;
	bh=wYsP8cX//0rpRYNJSb27S+esVIVihSU1dWHck+ptWIo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=ATHSKmn0ArcCU2A79cs4OJHTwZjSuJy29DvGBya1ThfKCGVcMjwIJXIofb8oC2zOVuaL9vMB18zpjBlnWPsKvf8AOcYjxpRFSwrT2iZQMJ1K7+ratPmRqfpLdjSjikyY8Zfhcn6x220dfrohwWJwfn2b5DGh1WfTnxgUlpw9WDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=cYGPI9KX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ar7EGNaQ; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="cYGPI9KX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ar7EGNaQ"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5FE381400167
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:35:34 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 07 Oct 2026 17:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1791408931; x=1791495331; bh=ZD
	mP8DzJugW5eXodu1u8OXMJRWyqdoFMQGjudVwguv8=; b=cYGPI9KXhbCE7Gkvq/
	66lWCmysX/OO1Dxffzb1WkQY7v4WBxsjqsWkZZ9Het6tbxTXPOLVCGZ+obzrl4oD
	MHHNloaxh1LIQsyqZqoCUQw071jyIPUbaNTMsXoouoh2wdFw8WuXfLU/UExHydwa
	cyPPCvnNb2yO9lBTdwqCFVg3FLO6ET4LScLvjqCH7B/EGHSYPgvLSChAXYKHV8na
	kC51lZJlmqsXUmMEkfSGtsBHP3GaO83cPa/O3RHDqezMyFgKoyquGifL7jTHgmO7
	8hJqVVVm7gzyzz6AKipr9jdnTc/lBG2juYXOVJLkC8Je5+XvNVYkz0bzB+ma2Ec0
	2kLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1791408931; x=1791495331; bh=ZDmP8DzJugW5eXodu1u8OXMJRWyq
	doFMQGjudVwguv8=; b=Ar7EGNaQ3EB5n6LvjSl+UzryVQNL34Mb+451oHWaNvnj
	pj9ai0fQiNexlFrku+uPcF7P/4c9lpo2Eh42F9upvFWlQ9THfbgVKK7csgyN5fsz
	VpiVYepWXXi6wkuUlmPLwqpjXeVweqcPEppvlNiEuMlhe0e3ehdNGTDhcw6xqD7I
	lNxlEF1S5CCcuudfPq5sCQ2gqhzi1dkWizCzYO6KtYnL+XzCm04gafAX2OfSQlSb
	Q3bf0apv3CAzaol1hZo97ybUqTFUaw/uzpTMoOfRueMAi9MHajgsVTGRC8AOkkpN
	F2onZY9HhSi8yNCaQyzSAeMwLh1aIzZFYYKxot1Qrw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791408931; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:itrXfeVOjWronNZ+zOiNG5Dxqc5QhPbfpUo0wH4R2iiQzGt
	VGGOytlAnGOSCVDaqz/FOgN+Dx6J1Kdu9wgkjArHzdGui/iGB4FbZ2GutHVPo1vb
	pOqbhlY1GgCs50IHBNfcwc954Mjv3d+aVQZSqx+baG91yC/n2tlHLxUIDd+Ws7as
	JYQ576ALQgbdseBeKDuNsKAVk2GroPgNHbKOSWVredbFGoZURozpvn5S/FT+suHt
	XdPPAj99zRLzoWt1LDMqrLEFC2vmbySmjZe3WPmAejfn1OffYgMtpCpBwLNA4h/k
	DO5pddMYpFAa2zN65ioB+0Ul+JIXgdkU1WQF3Zg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:9RIeI19IAZDvn4hm6qyw4aDeAN8s4u31KcNaWRkoBkg=:wYsP8cX//0rpRYNJSb27S+esVIVihSU1dWHck+ptWIo=;
X-ME-Sender: <xms:H7vGanqXgeKDC-yyKpM9Lb0kaZeiabSnFA77ekRRMGHkP0DJmaqXLg>
    <xme:H7vGasfuSytRjJyhjFAPXNRQLGeo7D2LojqkZ9SY_D1WgjQlqGzeIeGeapOFVrEDF
    0ugmkWE4mfOs79MJWQErQ8GUX8AfRHJjJoAyuOJUhS5yZ335nzDTNRN>
X-ME-Proxy-Cause: dmFkZTFVcA5N6AxELDaRr8i1HexnWBvhEKMQ8baou8io56McBPAWDv3xqkYXj3kGTbmuYL
    abVyTMMQ+JaZ4BqO1IawdKTUOBer4puvT/Ez2gwB/YaHWyV/1cTGGp1oL77ie6EmEb3bS8
    fGZUaoX2wr5S8w4Lk0Ag798zK9TJs81OWrvQt60zxbPxGNjYOjzpTVB3V1ctA5NbaWmt+d
    UIL4+Hl2pjJuTFX48+fDuKFWML9A+ecabJuy0w9nmFSbsajuzZM/9Bp65fR1QOJK1iSapP
    5JyItNqqHF7BVKfrlS5OzHN+dM5zzOEFVAZWmbRUKgtR/FmleMx0ltvPzg507omKuzKYcm
    YdKn5j7FqGudB9Rnm7P5BJeYkzLXI5b5PEZ30kHdrCbheI9v1XkABHrXI8lgjzxF1XJalI
    Isp04p7KZgryNfYJIUars4v1hQFkwnuSjgGq8nfaw+xzdkNHJSoPdD925RjikrIleSvbM3
    b2oXGmaVTm5DmwbrlBuXIPj+s2gwZNreckKap9R6PeEUViNp0ADpiW4vRhOSFUhXPT1p65
    spztcfHiVGvclW6t40BxxauRkFJdBIRnoZWDPzLIGG2AQSuYRfIfUDGsaywoMnyXFKRp0C
    znVsHmJbJe2cb60YiX6KxiNJD+CeZIbq+KFzNZTf8stM9G1HXiObIAKmWJCw
X-ME-Proxy: <xmx:IbvGauMjFMIvm0MMfEJDhYjPqdKBYnxFcIZAlvXqRW4SQJz1KyO_lg>
    <xmx:IbvGavM946inu2M7ORC4dNsJywJrLCS8E9lg-_GzpheZtEfbi4rJ0A>
    <xmx:IbvGaniOsdMgDc3J-XY2gulvD49jndj5t9p9Non0dJNl3ARRpSzGzw>
    <xmx:IbvGakvn6J2fzA1mnD8zmxZAg-UU26DWQocJuSNRzJSFq7wpX2BZ7w>
    <xmx:I7vGamjkn4UU_g94cyHX8FYcePZaBgWhF8hIwmjlrGVTA5-rbEkNBYHj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id BDE8332A008E; Wed,  7 Oct 2026 17:35:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AamXen0t4ZPg
Date: Wed, 07 Oct 2026 23:35:07 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Stephen Boyd" <sboyd@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>
Message-Id: <1399951d-6afa-4977-8514-ed30c5a2c865@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 7.3, part 2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3-2

for you to fetch changes up to 1fc2d80928b706147e371602dabd0ba927dfe4a3:

  Merge tag 'tee-fix-for-v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes (2026-10-03 23:33:02 +0200)

----------------------------------------------------------------
soc: fixes for 7.3, part 2

There are fixes in three ares this time:

 - Four distinct issues in TEE firmware, all fairly minor

 - Five devicetree mistakes on NXP i.MX8, lx2160a and Qualcomm
   based machines, one of these may cause file system corruption
   from an incorrect SD card supply voltage

 - Five fixes for clk drivers on new Qualcomm platforms,
   addressing issues with incorrect enable states

----------------------------------------------------------------

Note that the clk driver fixes should have gone through the
clk subsystem tree, we had some miscommunication that led
to me picking them up here but decided to leave them in here
to avoid extra work for everyone while we're at lpc.


Arnd Bergmann (6):
      Merge tag 'qcom-clk-fixes-for-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes
      Merge tag 'qcom-arm64-fixes-for-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes
      Merge tag 'imx-fixes-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into arm/fixes
      Merge tag 'optee-fixes-for-v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes
      Merge tag 'qcomtee-fix-for-v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes
      Merge tag 'tee-fix-for-v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes

Babanpreet Singh (1):
      tee: qcomtee: fix kernel-doc warnings

Dale Whinham (1):
      arm64: dts: qcom: x1-denali: Fix microphone distortion

Georgiy Osokin (1):
      tee: shm: reject zero-sized allocations in tee_dyn_shm_alloc_helper()

Imre Kaloz (1):
      MAINTAINERS: update my email address

Luca Weiss (3):
      clk: qcom: gcc-eliza: Fix always-enabling PCIE_RSCC clocks
      clk: qcom: gcc-hawi: Fix always-enabling PCIE_RSCC clocks
      clk: qcom: gcc-kaanapali: Fix always-enabling PCIE_RSCC clocks

Mahantesh Salimath (1):
      tee: optee: ffa: support shared memory offsets on large-page kernels

Shao-Fu Chen (1):
      optee: register TEE devices only once fully initialized

Stefano Radaelli (1):
      arm64: dts: imx8mp-var-dart-sonata: Fix Sonata SD I/O supply

Taniya Das (2):
      clk: qcom: gpucc-glymur: Mark the GPU CX GDSC as votable
      clk: qcom: gpucc-kaanapali: Mark the GPU CX GDSC as votable

Vincent Jardin (3):
      arm64: dts: lx2160a: fix incorrect pinmux
      arm64: dts: lx2160a: fix IIC1 pinmux submask rejected by pinctrl-single
      arm64: dts: lx2160a: fix the iic5 spi3 pinmux offset and value

 .mailmap                                           |  1 +
 MAINTAINERS                                        |  2 +-
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi      | 19 +++++++----
 .../boot/dts/freescale/imx8mp-var-dart-sonata.dts  |  1 +
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  4 +--
 drivers/clk/qcom/gcc-eliza.c                       |  6 ++--
 drivers/clk/qcom/gcc-hawi.c                        |  6 ++--
 drivers/clk/qcom/gcc-kaanapali.c                   |  6 ++--
 drivers/clk/qcom/gpucc-glymur.c                    |  2 +-
 drivers/clk/qcom/gpucc-kaanapali.c                 |  2 +-
 drivers/tee/optee/ffa_abi.c                        | 38 +++++++++++++++-------
 drivers/tee/optee/optee_msg.h                      |  4 +--
 drivers/tee/optee/smc_abi.c                        | 17 +++++-----
 drivers/tee/qcomtee/async.c                        |  4 +--
 drivers/tee/qcomtee/qcomtee_msg.h                  |  2 +-
 drivers/tee/qcomtee/qcomtee_object.h               |  1 +
 drivers/tee/tee_shm.c                              |  4 +++
 17 files changed, 76 insertions(+), 43 deletions(-)
