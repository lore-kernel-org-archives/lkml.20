Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E742931EE;
	Wed, 23 Sep 2026 02:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131795; cv=none; b=VWMzrjXSk+OZbRFJIe9sWt6LnYxr5NxV41zFFPW4ZMv3H0Ea3kZsbKIM6fujw+9qHxOJTnklLXaXzBCAplIk1nnhvwRrGJC6zBgOIfgftNhzi+ScJ3QPVCQEZyNpLnU1hLz18BK5gU0CTgPp/+/R+RwmIiV4RF0b6riJFB4FX2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131795; c=relaxed/simple;
	bh=s+tIYyq9PMY5TTi2FxpP7tqpTd25MOZtyZ2pMTY7WTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d2cvCLQmLr6ped4RPAY261xosF0oL1LtFKxAUiJOpvvZD/e9LAlre7TuldJjbAUmwkM5BqElaLgm4NRrDibt+zXaHSDRBAHOFyyVA68fLoeSsVKXZmw/l6dcxIqvs+N2SbwHOMuOqBklrue2iENCEF0wedVtsoP+wS84OxxBca4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VAHDRRkZ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VAHDRRkZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=KJXLFRlUwQXxHzrx+fJUOaQpce0T7pzSO9ODePnJVS8=; b=VAHDRRkZf5fEH7mENko9aATcAr
	oB1SnjgN4BVqonplAJfqdl0jqBPHYDvr3FLsXuL7jKmeVY7Bma0+rW4Fdv15fqB50rIONu72yD8qE
	YIsnYA8UtgN3co8SCl9c0OZg8AA3deCsHT/DfAJuOj0nbNEWdOmCYPPGbzSfCakgcwMH64jxgVyJ0
	Fqn6RHng0BKXaxB9tzewE6+tBoVTN49FARSgEUEYzMZ9IhYbz2AyASCjAv2x8rShlCvFo1Ebu6rhX
	PL2BnLY7GlB7prR9uhtX7ubo6QdEN5udqT77PRSTIH05s70z6YsWCbSqRJvh1B+63EpHt1rCzuJdB
	kLgwczvQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9D3L-00000006zCq-2Vk9;
	Wed, 23 Sep 2026 02:49:47 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] ABI: sysfs-bus-usb: use literal block for console commands
Date: Tue, 22 Sep 2026 19:49:46 -0700
Message-ID: <20260923024946.842697-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a literal block for console I/O so that the lines aren't merged
together in the produced output.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/ABI/testing/sysfs-bus-usb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20260921.orig/Documentation/ABI/testing/sysfs-bus-usb
+++ linux-next-20260921/Documentation/ABI/testing/sysfs-bus-usb
@@ -83,7 +83,8 @@ Description:
 		idVendor idProduct.	After successfully
 		removing an ID, the driver will no longer support the
 		device.  This is useful to ensure auto probing won't
-		match the driver to the device.  For example:
+		match the driver to the device.  For example::
+
 		# echo "046d c315" > /sys/bus/usb/drivers/foo/remove_id
 
 		Reading from this file will list the dynamically added
