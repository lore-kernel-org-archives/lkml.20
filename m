Received: from mta0.migadu.com (out-155.mta0.migadu.com [91.218.175.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45838492502
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593887; cv=none; b=kTzPvgrY6B5FIciDI/13so7f+KCwc/mv1s3U6VEC/o6zHva+6qWPCX2ElFqVZ908kNzZMFBqwK800bA72Q5ffpbWasGHeJuW58E1T/vw7PLVwjpo81hXlLB0BdKNZdSXLpsG5NWwgevMQl247WjlEP/xMbg6kUG5fV5u9WjWXBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593887; c=relaxed/simple;
	bh=Xs5HmIVrttwINsKb630tCSQ/nEHmOYxb9Ym6t3UCmkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=acPqxwoOVxCxpohJQNCKgqzVkpRntSMeHzgoWARsrT0NlSMPwEBxtkfcOloyRFGmf1P2j0/fBNClVjEAvEvDNH9CFdd8VX0UqQwRl1wYoh4iejTPp/CRE4+DZjHQydQubo+uziKW89JJcUllkBqyFWItz9ylnwxDRRwM1X4aDWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jimenezcarrero.com; spf=pass smtp.mailfrom=jimenezcarrero.com; dkim=pass (2048-bit key) header.d=jimenezcarrero.com header.i=@jimenezcarrero.com header.b=bKErcRzf; arc=none smtp.client-ip=91.218.175.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jimenezcarrero.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jimenezcarrero.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jimenezcarrero.com header.i=@jimenezcarrero.com header.b="bKErcRzf"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Xs5HmIVrttwINsKb630tCSQ/nEHmOYxb9Ym6t3UCmkc=;
 c=simple/simple; d=jimenezcarrero.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789593868; v=1; x=1790198668;
 b=bKErcRzfYsVjuqPh+TtOxvSIylFyAjKfQNhw6UG/vZ2S0N+U50Pir5J6ecJiavuaWjiQhgL7
 gZ5CaBTzguUcsHDXs5O3clwBzjLlr5f/zuRhWvTwstn1s1qDc5pwBxxuHGMNyIgnsBPlKcjkbVh
 S49O6rCk6eBQSLIoQF7x/csp2VOcbKFwYmx6+iFpKscPUYSF+4j7KW2rpXqQCfmP98cQcwZanjH
 HYiHkUPwvqTjcTOF+577l6mUCImJEhLC0Hr+N48b6D70zZTx9rcg+E/8iG14RfFkmyE/1Jk+lpZ
 2bDOic6rwTHt3Z20JyF3BLy4jj9/twB+XYn3wnKCERUjA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bde3667cbddf0f0b;
	Wed, 16 Sep 2026 21:24:27 +0000
X-Mizu-Trace-ID: bde3667cbddf0f0b
X-Migadu-Flow: FLOW_OUT
From: Juan Jimenez Carrero <juan@jimenezcarrero.com>
To: khalilst@gmail.com
Cc: khalil@rentman.nl,
	rf@opensource.cirrus.com,
	broonie@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	patches@opensource.cirrus.com,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr
Subject: Re: [PATCH v3 2/3] platform/x86: serial-multi-instantiate: Fix SPI chip select on platforms with incomplete ACPI cs-gpios
Date: Wed, 16 Sep 2026 23:24:09 +0200
Message-ID: <20260916212409.7255-1-juan@jimenezcarrero.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901192625.1497791-3-khalil@rentman.nl>
References: <20260901192625.1497791-3-khalil@rentman.nl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 1 Sep 2026 21:26:24 +0200, Khalil wrote:
> Some HP laptops with Intel Lunar Lake and dual Cirrus Logic CS35L56

Tested on an HP EliteBook 8 G1i 14 inch (DMI board 8D8A) with 2x
CS35L54, together with 3/3 and without 1/3. Details in my reply to the
cover letter.

Tested-by: Juan Jimenez Carrero <juan@jimenezcarrero.com>
