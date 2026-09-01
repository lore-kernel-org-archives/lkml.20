Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4993D8900
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276687; cv=none; b=mEuemVrLgITIZmBzrQ7VYAliBHasjQDsWiaJ/mks8iKqT9TInghe6qBXrM5sB/eiaRfmQWpPtLrzRW8k2aFZ29ZTjbJ1Fp0EpXMOq1Fw28Z4Ik9yQEHej5aBEFK/r4fsAwjWRaqs/mtijK2iotXcFZyRVJaWTXQXYT0qzDZ5HSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276687; c=relaxed/simple;
	bh=7BFZhNSOareWcX7VGdQfnFAQDysNGmECn54AT57ukPs=;
	h=Cc:References:Subject:In-Reply-To:Content-Type:To:From:Date:
	 Message-Id:Mime-Version; b=O7q23RXHSVV3cxmBW1oTgbA58k4DFqpcs1i1r2KrQgKvPR8L8c4KVDg1+iLzBYTSoxhUfmU9kRkiyAnSXChC8NC8GZfCsLlENZirmpeAndffBP72LR4x/Yw/2tQX64KnIJa4p9Dljek4qtYUPePY1O7OskPAzlb9AcqHwtfvtq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=bi09KIZ9; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="bi09KIZ9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1788276673; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=7BFZhNSOareWcX7VGdQfnFAQDysNGmECn54AT57ukPs=;
 b=bi09KIZ92RpLKu1jhCFCcRAAM9AqVmdmmzOs9rRTDvXqpXZrHVSDQ4oqV5a94Fn8i3zdI5
 XTTETSkvM7lIwVOgmZM2YaFh+kBRbrcV+zInCZDAE2rXOva2THMn8va6HeBuJnVuqZJl72
 cSeq7dWlbuchMOSBBjAXM+YFc+P693YZv5kUdLaGmEf3OIMjbkxooxSOaLohJ5pbtn9I6Q
 bI8cYu1qKt7i/a7UqG7Ssqnw9VbrCCAnRq6ib5atvR+TkxsM+pC9BgJckdp4NfKd6D09j3
 TsalbOBUafOZ8axeD5nbRd99jErlbSEz9TedTlrVRIWi/xKlxJDsu4zIXYqYDQ==
Cc: "Rui Qi" <qirui.001@bytedance.com>, <pjw@kernel.org>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260813130357.1144775-1-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
Subject: Re: [PATCH 0/2] riscv: Fix cpu hotplug warnings
Content-Transfer-Encoding: 7bit
In-Reply-To: <20260813130357.1144775-1-qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a96efbf+b34491+vger.kernel.org+qirui.001@bytedance.com>
To: <palmer@dabbelt.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Date: Tue,  1 Sep 2026 23:30:57 +0800
Message-Id: <20260901153057.3557226-1-qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0

Ping.

This series fixes a regression introduced by commit 2b2b207e1162
("riscv: cpu_ops: Change return value type of cpu_is_stopped() to bool")
that causes spurious warnings when offlining CPUs.
