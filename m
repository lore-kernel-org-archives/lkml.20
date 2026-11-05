Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886988;
	b=LRCiSRK11BTx4wUyDUjRSd8CiRePOn/ZRJUVm4leFlzn5aGnaP6Urddtt7vnoP10JYmz
	 PhbbJ7Bu23IBOC0x7bauRMUgnnMF3tV/3+hkHsAdlEO/j0IEk/2vfo6NPQRukDbG7IBWR
	 Ry2Ommi2GI+TvdT0w5NPQmeh21xYilcZA/Y8NnPRRb2axHiaxqTJOdMC5W5TOut6d0AJI
	 DDopkKoLdXWz5PTJgCLWLm6dmatA0iuKfYcX3OOXfdbClFE3wKUoe4XVgG6uvd80OWGnS
	 zFGpLkCFOGB700Jwm/ex1vRB28PzvdFlfePZ6sdYk0JI2bL+06QETKIJkHsjtE/7J9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=MnG6yZInvTwf5F6jbe4J25KCOPdwe8E8KATk9RGlMh8=;
	b=vliqMl4+4Wpx8p4niPft5R+O8bQL3Pj7UH4uSiLSe4SJd3OFgEh6Q13q382dnIcyyAYN
	 8h9JfuboI2HbLaDJFypR+OIpEczQGUTwfpXVxDOQflJ4maRz10AsO7ejt6zYzwn9qoHnP
	 2xTobNAd4kDORafMxCaF1pnD9TedfVJHsZHU0G+Kp+mRXuKq6kn9kSfrcECEAmM0AvTEv
	 YTQwZJFaLn7DHIXG5avg3n75NFKxSyNqQdCWJOufqeRBa1Oj1Wb3Gc7qVwPfucSgWVzjG
	 Y5QQQR59CBDk+XPLGy/HaA2SSExdtAgwldVYUESMVwWz+nUjbIVLqALjqvl7HW4LU7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="M/O6l/ms";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5619D606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5619D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M/O6l/ms
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1653400f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793886987; x=1794491787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnG6yZInvTwf5F6jbe4J25KCOPdwe8E8KATk9RGlMh8=;
        b=M/O6l/ms9mwqaMp/N1zXbFbA9xm9ZJksmibBMKNe9kr68Nwes0K8JjEkf+18Y1fudW
         UptlPqnqoT6jMQY/VJHezWWy3RaS2dfo8Luj5j6ra9PKF7V5vQp6LucnwxFjL+O76ax0
         r6kSmhpF0/ag5q9WHlTkGMKHGmDcpY+sYg94e62px0BPt63iHXkYtmdOx1CqMrAZYqk3
         FQlPgT22/DEFIj2nejVJP644s8VNUuEtAxpILdUhK6mX0HHc2mZYnVijt11YCUkkF5ly
         Rq6CP0Dkq11wOQDcsc/f9kYkgLdwj//9IJN6FM6PEyMG59oQaeY6BzO5vqAndmW0CLm2
         sEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886987; x=1794491787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MnG6yZInvTwf5F6jbe4J25KCOPdwe8E8KATk9RGlMh8=;
        b=GY5bxt7FldqvWkdgsUHJgJiRxa7dQM+Dv8lhxyOf9PZCvus/Wl1e0N+wCkXIzvKt3G
         u1VFZj2mZKDhTcS7HKxdgCPRhYIQ9wTdudZD5Rus1xw1jwz1wm5xIThw4jUwT62PLV4H
         8Kq2QUD1OIgJg1puawDys/qutqhjWjhwJYOHZwfW9kGXiqZJqVmELY1crUse+1fR8ody
         nS3MZ+j0hKauNuj1VG9ZQECjLdynx7CdY3T5+985IwMPznKI23P/msXDWg8jI7EruOyg
         xKwT0mr0InCCBDppUhrdJgsmDb+E7HW6LLBO6AT1/Oq7F3diSrrJKqNP1mMhVU5Hm1ie
         vlEw==
X-Forwarded-Encrypted: i=1; AKwUvBwhX5E0W8FC0tokNu3PnES2DrfzK7JKDfBNYDrlNdbgjjRns0JmDm0KQls91RchQ1oqv1Qt5+IZUEQD9tA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JynxM22AfcPMOPyJs2US1dShs74uG1yuSqX7ggIqP85FcOc0L
	eH18nAXZ9SWsY9SGqbBkwBctrm+fA16LHYpfgQgxl02od+F5cj3sliuu
X-Gm-Gg: AYBFou3FYY8KjmU/+6w/oP0Tjufhsn1enp8vyW2DqTvmuJRnFJ8e/gmBn4O6MRGpqNO
	nemjxqML3Sh+jYYXbvWJOLph8YHu17pmUEhPqcY0+j5Moe2UhUlPxJZLJFYnob8hEbfWdwOCn3k
	ix//VNPR6X1QtLel3ENzvlsP/g4K54mjNsjwswI+bU35EzcHdKMaLj8qjqRLPZz5HTp6xquCnHZ
	8nR52UB1VxmfccVrxJNHkalYSdeCxWn9vWICjiBnSjJ5O3g6mXr2T68vs0Ntn1oCbGUS78uDwpI
	5/w4SRxsoqKHKTT/2lUvf34G6ZIWo66TQVV8kYVA+96mSvSetU1oZJgnIkc+CvP9hrGB+YIkP4P
	R2POdchO6icQGs3WUCXgKJ06exkOn+py0yVSmwLS/g681tcmXPrMoWh9K4AiUU5aWvknPGZ3SQi
	w6geau1VWvINp9kLG77GuRVn8ZUgwi2yVDd72ZlpbkNYfTd9Zne5wL0XyrnNG8Qcf46HjU7tHU5
	QHVscJJZgS+d0IcH62zqic40Ba+uWrNd1gnJCHMlfaFvCnvBJl3FZYi4nDKXRjQJ8MMS9WGYDHF
	QbfbCu9SdJZlJS6GpqGpSzZnIb8Gpg0MyZcYUoNLFRnDC0M8OiASevqXafQVmC8AuFPIpH8N3pO
	vlpeIOU9m/VMUaV/zHpEOVQqLzbdBW4r/9XMNSjBoz0UqzSpVBsX29IlLYycNnJXV1A==
X-Received: by 2002:a05:6000:2dc4:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-48e6e535ca9mr42188334f8f.56.1793886986450;
        Thu, 05 Nov 2026 05:56:26 -0800 (PST)
Received: from fedora-ilan.home (2a01cb0082e4ed001ca32839dd1d05a5.ipv6.abo.wanadoo.fr. [2a01:cb00:82e4:ed00:1ca3:2839:dd1d:5a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fe7189883sm10537639f8f.0.2026.11.05.05.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:56:25 -0800 (PST)
From: Ilan Bonneau-Zamon <yolezz.secret@gmail.com>
X-Google-Original-From: Ilan Bonneau-Zamon <ilan.bonneauzamon@gmail.com>
To: yazen.ghannam@amd.com
Cc: bp@alien8.de,
	mario.limonciello@amd.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Ilan Bonneau-Zamon <ilan.bonneauzamon@gmail.com>
Subject: [PATCH v6] x86/amd_node: Continue initialization even if SMN reservation fails
Date: Thu,  5 Nov 2026 14:54:48 +0100
Message-ID: <20261105135448.40695-1-ilan.bonneauzamon@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260916163618.GA1395@yaz-khff2.amd.com>
References: <20260916163618.GA1395@yaz-khff2.amd.com>
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

Currently, if reserving PCI config regions fails for a node, amd_smn_init()
exits early. However, keeping successfully reserved regions active helps
prevent userspace from accessing those registers even if one node fails.

Change amd_smn_init() to attempt reserving regions for all nodes
unconditionally, logging a warning on failure instead of exiting.

Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Ilan Bonneau-Zamon <ilan.bonneauzamon@gmail.com>
---
Changes in v6:
- Attempt to reserve PCI config regions for all nodes unconditionally,
  logging a warning on failure instead of aborting initialization.
- Remove obsolete error cleanup labels and release helper function.

Changes in v5:
- Drop __free() cleanup helpers and custom release logic, switching to
  traditional goto cleanup pattern (as suggested by Borislav Petkov).
- Fix changelog attribution regarding brace removal (noted by Mario Limonciello).
- Update author sign-off to use legal name.

Changes in v4:
- Remove unnecessary braces around the kzalloc_objs() error check.
---
 arch/x86/kernel/amd_node.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index b7926ba3610a..c0391b081c0f 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -250,8 +250,8 @@ __setup("amd_smn_debugfs_enable", amd_smn_enable_dfs);
 
 static int __init amd_smn_init(void)
 {
-	u16 count, num_roots, roots_per_node, node, num_nodes;
-	struct pci_dev *root __free(pci_dev_put) = NULL;
+	u16 count, num_roots = 0, roots_per_node, node, num_nodes;
+	struct pci_dev *root = NULL;
 
 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
 		return 0;
@@ -261,19 +261,20 @@ static int __init amd_smn_init(void)
 	if (amd_roots)
 		return 0;
 
-	num_roots = 0;
 	while ((root = get_next_root(root))) {
 		pci_dbg(root, "Reserving PCI config space\n");
 
 		/*
-		 * There are a few SMN index/data pairs and other registers
-		 * that shouldn't be accessed by user space. So reserve the
-		 * entire PCI config space for simplicity rather than covering
-		 * specific registers piecemeal.
-		 */
+		* There are a few SMN index/data pairs and other registers
+		* that shouldn't be accessed by user space. So reserve the
+		* entire PCI config space simplicity rather than covering
+		* specific registers piecemeal.
+		*
+		* Continue attempt to reserve regions for all roots, and log
+		* a warning if reservation fails on a particular device.
+		*/
 		if (!pci_request_config_region_exclusive(root, 0, PCI_CFG_SPACE_SIZE, NULL)) {
-			pci_err(root, "Failed to reserve config space\n");
-			return -EEXIST;
+			pci_warn(root, "Failed to reserve config space\n");
 		}
 
 		num_roots++;
@@ -298,6 +299,7 @@ static int __init amd_smn_init(void)
 
 	count = 0;
 	node = 0;
+	root = NULL;
 	while (node < num_nodes && (root = get_next_root(root))) {
 		/* Use one root for each node and skip the rest. */
 		if (count++ % roots_per_node)
@@ -316,6 +318,7 @@ static int __init amd_smn_init(void)
 	}
 
 	return 0;
+
 }
 
 fs_initcall(amd_smn_init);
-- 
2.56.0

