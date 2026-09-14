Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E88F3E557A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789424081; cv=none; b=sWix3/uLtBMMWO56b4Mw1dvF0uro8uS0QB+TAXnP+7MHMP72al1J96EQhOY6/z6DUVjybrP+V9RUtyer9IExZ3Bpa3Ob98NKyhEH8OFT8xxqofFXeLmLTLieUeETj67EmLcEH/k01zdXpUaC35JK7Qmd7NIUKQwgKNLeyHDMo3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789424081; c=relaxed/simple;
	bh=FOuoZH2gZJQGYCPIpJVPnR+e2agxceKBRqtlWRxeB8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R+YqGqt5T5PXesniQ1+O/LDDRLb/bjJOz9H5kRh68ybW0McLVVHpNeMA0Y/5uJnZdX1EvglFQ60GvgMZmt1zXdP44V6DMyJHmPDdmTSSIqaDVz986DI/I5l+vmvnUJdghRAu+2Q0j4UX2RBz2RPqI72gG2aiNqNhIy404/zoT1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=UVv6oJdi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=f8ze+nVf; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="UVv6oJdi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="f8ze+nVf"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 73C547A00BF;
	Mon, 14 Sep 2026 18:14:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 14 Sep 2026 18:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1789424078; x=1789510478; bh=1QD9IBLRvN
	SRRmK+XaJ2HlFMI5oVRFqPhTcMYdmMNIg=; b=UVv6oJdiaX+wMqJrO7m1rmKkGE
	gtFef1g38hTTYNePbnLv1jGaoNb8mJe7BPOWvgiXXGTXT21MjUkjphQferwqVKbB
	q0gYNZ7s/jJ0lw9SZMCXP5LeyvhADDQ0eLaAp6AZiXB32mZfXNXM4fdSnjwHQefl
	sgVagKxYmOtSS4hEpbfgdsmNh3lZkgtCiq+H2YzOUxL+G1YmfrZojxse3odWXppu
	ivd23ElRue4RQsQsRv6OGgBF7J+Dn/EC8zyThOrOhGsIJ0U7tp7t6bhuvx53y8hI
	kSxmsR/1M5jHQTTRi3MsRW9Bka3NAI1QVhHo3QPlvv/9S98hnbLgUivN6RGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789424078; x=1789510478; bh=1QD9IBLRvNSRRmK+XaJ2HlFMI5oVRFqPhTc
	MYdmMNIg=; b=f8ze+nVfQd6xDz8znpQ2fHivz9qKK8wNeFrmLgO59juxeko44GH
	Bcwam8PCO4Sk/4EVBAYjol43iTkS3GEw6lxCG7z3s8++eTcdSj0BWUe8repm4c1d
	+Zs+egMaKxPX6lr5AKHjvQZpWwxG1pGs60GwkmfiZaHoc7vkiQ0VqughQJ4zgnNh
	VV4cKnPYhZMNr4ni+2ArNS9jOr8YGkQ5HGUmF0ciLniMQozDQSbpeWSyHISZ5Vlb
	JdxcmIWjpqMoxrbeRSGiY2yd+fcvT/FEK0uvNIhH4AD8Cv5NJ2GltudcKiCHsNTz
	DfMeS5xYet7eua2e0ywx363VTLP2cit0mkg==
X-ME-Sender: <xms:znGoanh4ibl-cNhn36-aeTt4wrHfNs6MMRx4qiE8DQlwwrgOVqbJlw>
    <xme:znGoah9kPsj2VfhEWiXYjt3i8jyQHtH2dALTcl6yywVw4ExvD9xmg-JMldekLN3LZ
    NfqqRrHFpbhKiO61mrkhHkHkuam9KJE6wt6i796nzzxumGlWVCqJXjO>
X-ME-Received: <xmr:znGoaur43mh9LfraU0qA48MbfbFoTNOqs4jBvkXsAz1_8T4pegCmlmGg7gdXUC8vxgDIGRRgknlHhivuLFdDu5zlRNhoTju2ClXzA16c01scIA>
X-ME-Proxy-Cause: dmFkZTFc5SjZ0csUI1XI6h2Wm2EedIZ46G2WFow4gQUqloHln9GGTRoWeAflue2OWXEn2U
    NNZGLd58M6uSBvKVHr3Lhrg715TbsQ4Rsjz9OWF2nJEpoZYEAWC7lkVmtukdjJG5tGaK95
    ljF8YU8cN3dZvr2KFRPU6owprsbkEqJivS7kUuywEIq1AlQbt9IOSoCiM1hbAa1YaRoW/C
    RvIYR+kbUIIDoHHUkHp5psznxOYOfX7voAP/mqKi6MIF3COqEPWTnWpgQU6MAfUQXAn+xx
    mZbfh9QCzEdQB9G2l8z2/cHKgsJOs5gDTVO9iZpwsuUvOsR4j5N+cYixhv2YgmIjyTv6Q8
    HX2qEr4uYdpF+mnZv+MPOqYZq9jQycGo1G5OcZhdf8qpNlcB0ioJ+3ybeA8NnU5xxlTl+i
    hCXAOtAYizvWjyloBn2wqYD3QQk+n5u3tQGKEMuuEXJGrmMBpJeAvnsRbllIk2DwFEACYQ
    0RjIXo/GsSsVOYbliDcgUke1Yh5E1w4shp0tzimabE5FpSweQoODwi7F9/Dgt3OYxTDMin
    tVdYkgz2+H9oElvRPlB8pX3U3YtTUtXMjhINkHaSCxECU/YZPDGrYOnb/Q7PGPObtjw5hx
    RqZz6Y6e46PLfI7JB0oR3YCWRIJBKzDLufAVKZHopbs7wHQwSs38guJLJ7GQ
X-ME-Proxy: <xmx:znGoag8j4vtjGKl4sw9r3KzP8iyE2x4mWIicfUpkkruiJeQvkpWOiA>
    <xmx:znGoaiUaMZoOj9JAd8uoKyCMF0KIITnJMxJR3VjrIy6k2GQU9rlZkQ>
    <xmx:znGoamBXU6ZbeztjpgaN2XX1gi1GizBSKSVs4CLvdnXEO2lDZ9S7UQ>
    <xmx:znGoajx8-rI_yALo5JJWIYT6Ok13rjRPizhmrOVeizGmYyrbYklZfw>
    <xmx:znGoatV-YPaVi5yOrIGNpennkYFJ8Eh9saE-l2EUNSyJtxtn02FORNTs>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 18:14:37 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: core: correct comment about execution context
Date: Tue, 15 Sep 2026 07:14:34 +0900
Message-ID: <20260914221434.213633-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment for fw_address_callback_t describes the execution context,
but the callback has not been called from RCU read-side critical section
since v6.17.

Fixes: e884a8a0c573 ("firewire: core: call FCP address handlers outside RCU read-side critical section")
Fixes: e8cf6875005b ("firewire: core: call handler for exclusive regions outside RCU read-side critical section")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/linux/firewire.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index a1e0cb4526c9..cbe59a18162e 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -299,8 +299,9 @@ union fw_transaction_callback {
 };
 
 /*
- * This callback handles an inbound request subaction.  It is called in
- * RCU read-side context, therefore must not sleep.
+ * This callback handles an inbound request subaction. If the request subaction is initiated from
+ * the local node (e.g. by unit driver), the execution context depends on the initiator and is
+ * unspecified. Otherwise, it runs in workqueue context.
  *
  * The callback should not initiate outbound request subactions directly.
  * Otherwise there is a danger of recursion of inbound and outbound
-- 
2.53.0

