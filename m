Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4858D4A3866
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636426; cv=none; b=pgtQ8MB2vZ7j2+aNjKLxDNFBm1lFZhkQ9ak3I8sgHYKQ5Nk+2k0otvo8hRhkKmv1jv1VGjXz4Pz1A+gn6ZNDzBO3BQbJFpySHOicYAhb8y3O6atgr5MHZ0NAeSXE+2Z+ki/EBayod6MA3MiwyzNawnwrcTkY0N27oBXhQW7xtXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636426; c=relaxed/simple;
	bh=HDLCyYMXjeLbAmwYg6ykun65beRY/Xe43LPVoBMshhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lis0YdEbCcysn29HsF1O5pAIJUZAXdIUtal8il3Ebuio1hLFuuBK8V+QdJtx7M8MyHW/qQTfOag++pujY+QAfEcQRSbhbH9/1ioj9MIlwkW6yky7Ove1cuVHpd4Te/B64T7SaWawLby/vUY9iXWisdV1MiLDSz06Bpu0mtfRuU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YyghOKBu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YyghOKBu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99491F000FF;
	Thu, 17 Sep 2026 09:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789636424;
	bh=lKKNVKamgJXzUQksg+fc5sC0ecR8r5laMo+vgvG2iqE=;
	h=From:Date:Subject:To:Cc;
	b=YyghOKBuTO7G0vhHogNGVEHe/ROTh29dOIiiYdDX62TmNVaXWLfCRmsd6vKNiHyIn
	 fmnqaY6gDp/9GIsMs+pqwcQDWT5SvE28FR97xWZmsxEA1jt6ndFcHJAjIQTwyWqWlJ
	 9soWoYTpNT+k6CqhXj6FRUqxYyDJXxhQ2/eRK1jbzxQizMlt94lsCZA7iHGCcfkU0w
	 zwOC/sJ/9oMtiFNweI8KAlqYvNZ52chCZeUbu7SBJZ+6Bn+50VYSZHvF+QJOSlBA6k
	 XH7xhWyxT33bkpXNX0/xI/Tow0ZwbvQl7n2uzZCRiPMhkfS2wgIrXD6xmXhOoknKNM
	 d7xqUExyV6x5Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 17 Sep 2026 11:13:32 +0200
Subject: [PATCH] mailmap: Update Jingyi Wang's email address
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-topic-mailmap_jingyi-v1-1-10873acea2cf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBRF0a2YP5YEGJTYrTSNQfjqMxUJ2KaNc
 e9FHZ7BvRtlTuBM92qjxB9kLKFA1RW50YaBBXwxaalvslFGrEuEE7PFa7axnRCGH4Qz0mvfdKZ
 XikoaE/f4ntvH83J+dxO79XjRvv8BJ5jl7XgAAAA=
X-Change-ID: 20260917-topic-mailmap_jingyi-c70d2d9b7f11
To: linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789636423; l=1237;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=6iuMG1KmVkfnJqL+sEpwbXyY5tRN3Q0MyoAoa7LAl78=;
 b=tT2P+w1vci5XamBMOKfECxI73d5peOP/sBeDt5/3syRoeOi/uDT6ORORK40i8SnPMS8d7uI3C
 0qpCH57DAZqD44LGsFZObpV2haa07NZ65wZ2BHQO6qGk4kJBK+bpcf+
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The quic_username@quicinc.com emails have been deprecated inside
Qualcomm for a while now in favor of firstname.lastname@oss.qualcomm.com
Re-route the emails to Jingyi's current OSS email address to avoid
Outlook bounces ("recipient's inbox is full").

Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index b27f33fcf9a1..792825bc699b 100644
--- a/.mailmap
+++ b/.mailmap
@@ -444,6 +444,7 @@ Jessica Zhang <jesszhan0024@gmail.com> <jesszhan@codeaurora.org>
 Jessica Zhang <jesszhan0024@gmail.com> <quic_jesszhan@quicinc.com>
 Jessica Zhang <jesszhan0024@gmail.com> <jessica.zhang@oss.qualcomm.com>
 Jilai Wang <quic_jilaiw@quicinc.com> <jilaiw@codeaurora.org>
+Jingyi Wang <jingyi.wang@oss.qualcomm.com> <quic_jingyw@quicinc.com>
 Jiri Kosina <jikos@kernel.org> <jikos@jikos.cz>
 Jiri Kosina <jikos@kernel.org> <jkosina@suse.cz>
 Jiri Kosina <jikos@kernel.org> <jkosina@suse.com>

---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-topic-mailmap_jingyi-c70d2d9b7f11

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

