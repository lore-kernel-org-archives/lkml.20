Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692281;
	b=dCywoKst0UlPQaGhpe9pVdUfMpwMIBK6Co5v3uswcAsLIOWjHg78d1lQDnqBkevcO8SI
	 Hj6jnwoDjSKrr6b9y1trZW78AQ4ygIlmMwN6HT1EFyV+oYFgYMEZbz43TuBCWdO7/hc+N
	 4/AgJSQTJ3bMZ2JCzpdBYBS1wRwRCqaPyfV/bMhTyy7+I6Oa6FXhcnh2pQ0+F1t3558aO
	 PXgF8e/qG1NWKEFACnT9ZjszLNerc3clZTciXUKRSVPE6UM3vI/zdhbGQIXp5g8AcTeoL
	 urMe5oY+VMJj9jJHR6ALttyjyW1qdQckbjRNdhbTd/RlxsxlbCWXYaPgWP1VSDoEQHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692281;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=GncGiazxrXrsjwlcJVAWV9x/0Sqn8xI2X2O08wO2RKM=;
	b=2Kihfe1KzhWqi+Q3WJB6eGCIkTsK+9b1ONrp86C7R+9ACsqEhpApk/y/rb7ddTretZyn
	 s0Y4pWPQbCX6zsVacQvvvt3mO2xG019uIazkNqbsHUvzjAuNzmrATgmtBCSfOKGst9QDU
	 ok9wQ9BSIQ+vhPsAWWe5DcFE/nWRawc6WyW4CMXY5+DIYBAsgMB74i8lG/WCn2/UQ/mmW
	 fyzxtZQIdHGg3P6oeAi+DS9BktXY/7wGrx0z+KwXtlONEqwVHwBsmYWAjCtWXht6y0kvC
	 PY+KROulBYefdg+LsubvnYpKYFF2lX7FBKIw5mjGwp6vRdjdgzpAqv5W/8Go1BiX2Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5730606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5730606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5E4D168BEB; Tue,  3 Nov 2026 08:51:16 +0100 (CET)
Date: Tue, 3 Nov 2026 08:51:16 +0100
From: Christoph Hellwig <hch@lst.de>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 07/14] nvme-fabrics: Annotate nvmf_lookup_transport()
 with __must_hold_shared()
Message-ID: <20261103075116.GA3844@lst.de>
References: <cover.1793654853.git.bvanassche@acm.org> <f7be25530c5ddb30da2f13638a35e2daa8002c0c.1793654853.git.bvanassche@acm.org>
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
In-Reply-To: <f7be25530c5ddb30da2f13638a35e2daa8002c0c.1793654853.git.bvanassche@acm.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

I'm only seeing this one of 14 patches, so I have no idea what to do
with it.

