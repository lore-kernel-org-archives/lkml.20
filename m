Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643221;
	b=CB7sMe4TquzH8yVL+K4xHy98ywnzTa+Cs5AZxy26z5BfJJWdTyWnvczP7Zy2W4faidRr
	 KIAnh1vIsrTNSzmr6NXKSfpV5tXU1D8JBXpxLEAORwHcSpALwCCRb+KuHZvauq24yTQ2s
	 X7TSuE1CFj7jNQJsNHmb/wOCvf8ueqeYavshRj9U6W86784jwCVd8Yh+NWl6cBwpjTg5F
	 D/lMUlTWBSLlElnyizgviXjsH+HElCp5HyKfY954fhv+bdBTTJ8XF6B/+fJizgd+kZE3W
	 rsQsN3tEGa5J7PILZkDPgxAoslr6PZSC640gy7tbHKseaKvI7UzBlwItx+wQ9HzLC8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643221;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=MbXBEbipF3YxAJZZXXXqYZqZ4lcyVtqj4CB6THU9B9c=;
	b=jvB5Rq31i3JowhKPFncagEjqzZVC6z6e/u0ujonZZwm92wkPDUxr0QCJHHNzBadsoNyt
	 T1N4J7Yw5UtsZ6MzxTJcDmTE5dOYlTC79YZmZXBbfVWnWJEzfLgUHQD7qYOACP0sJdFnA
	 lF56CkeDHZDn3A3pb7FLzClKC5qyedlzDbTV+/ig9UuCx7aIVlcU36zFt8YkTKKnHfHXG
	 0G+3lb5LgbdbyiBaMxQl1gEMnNvgomZ+kYDQscBR6rbt3C6E4GhXQZbB9MCJXLXrGsyYI
	 v5cQbRQ/0xnsxpMUwjAYQjdTJRuk5MiML0kUbODsrkaGdSk5GXtoPyLnled9aJRsAHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="Y+EB/AQX";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05347606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05347606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Y+EB/AQX
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A6CB1C14;
	Mon,  2 Nov 2026 10:13:37 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 37C2E3F673;
	Mon,  2 Nov 2026 10:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793643220; bh=8CczlIzAKtln1QsiXMCkJ7/HIe8sA4bYqfmhkIpAQQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y+EB/AQXMnU0oenOVb4hmpwKTqhhqaW+8c16w3YNAHuI/eIv5A8BbqsehNOhlHH7n
	 4yJJ+Z8Kn6vKXMSch3i0N+qvm4E+NVXF8HnUmNB0HPep9IMxgvu320XPtKiMvs/G85
	 6flRp90SwQmTVA6KXZKKfTvv22tpOpWRhFYAd3qQ=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] coresight: etm3x: Remove redundant NULL check on perf event attr
Date: Mon,  2 Nov 2026 18:13:28 +0000
Message-ID: <179364318572.3015146.1161972297282464649.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027-james-cs-redundant-null-check-v1-1-ed9486be26e4@linaro.org>
References: <20261027-james-cs-redundant-null-check-v1-1-ed9486be26e4@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 27 Oct 2026 09:17:06 +0000, James Clark wrote:
> attr is derived from &event->attr, so it can never be NULL even if
> event were NULL, making the check dead code. The only caller,
> etm_enable_perf(), always passes a valid event anyway, so remove the
> check.
> 
> 

Applied, thanks!

[1/1] coresight: etm3x: Remove redundant NULL check on perf event attr
      https://git.kernel.org/coresight/c/11b6f1e36a23

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
