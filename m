Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880221;
	b=blJeMRlhjCXhZ/6BvP7myzOZFqtrxwLlfNufP7aH0zgE1Nb2cLEIGeO0w4/pxQcsN2dg
	 FsMYuRjmIWWJhThEoLsT2kGVo+OW3V3DPUcImgLWz9GeLo/dEwOXsSbds3qRFgkF519As
	 3q31yQhdoOga1IxmYIILalQGK0bLRfQCEAs/gekcYZZ6Leztxi9b+81fuRZKmus0fRL0w
	 jAUYMVQCA0Gvkd1UgI2Cl7E3IBojWoh5DP9CdJThNw4G8S7ngnVynFNpd7kNZwNhmnuJS
	 eCCTUQvbbzJ/7h2QDs9io3ii+/6jbFgrYy+RQ5rzSYI02stOQtpaTmlR6/hkN89h0kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880221;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=q6cBIoF+VYU/H2S1exF0xL+Pb0tknVTGpQy70pOSy2E=;
	b=Dwe78utYz67ZPsnlSkI25jCyAftp5P5cMXbXJLIwXjNfWomIbhnp4G5MESiehXN3s5kj
	 L7EP709UaW1WMlNhuere+VqbiXfdi0Aq6xcWLOpVRNbtUnk77ilxnZSchffBgGc3bGzA9
	 pGivBa8oSL/ZoWI4pCf2+Ld6WubnBs1K8lwtCvnHVAGdKhSDsZ3061UDCOvceDWCFKF+U
	 qeOcl2Kdr+INl3cvD7UlE75HlAKUvuQvtfCIoMaZxmDR9kHN2kjOuNzreSvR+ZN/6DOGg
	 k7kZaaI957HofV8+toKPdQ8glUXKtgKG8zQnLkJ4hnk1JktqN3zJmaQCM3lMiCzuTng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B81B606A31C;
	Tue, 17 Nov 2026 01:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B81B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: esmtpsz17t1794880144t72fc8369
X-QQ-Originating-IP: I5UnVHLRzFfkRoyF1LLlpDG6uK0vZAsjjHQTUOu2Qkw=
Received: from localhost ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 09:49:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14566835138318392029
EX-QQ-RecipientCnt: 10
Date: Tue, 17 Nov 2026 09:49:02 +0800
From: Yibo Dong <dong100@mucse.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	yaojun@mucse.com
Subject: Re: [PATCH net-next v2 2/5] net: rnpgbe: Report link settings
 through ethtool
Message-ID: <236B4E2337BC768E+20261117014902.GA205295@nic-Precision-5820-Tower>
References: <BD205A7832D36E7D+20261116030917.1329989-1-dong100@mucse.com>
 <66AFF2810AB647C8+20261116031020.1330219-1-dong100@mucse.com>
 <d7351f56-d4fa-4ba0-a0c6-c7bdf7aac460@lunn.ch>
 <2207C8DCDD49F5EE+20261116044737.GA1342898@nic-Precision-5820-Tower>
 <cf674063-6c6f-43f6-a18a-d7ed5bef8a5c@lunn.ch>
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
In-Reply-To: <cf674063-6c6f-43f6-a18a-d7ed5bef8a5c@lunn.ch>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: NiFdmnmiW14nJEFyuzzHiaaN4597f/YmaoxGTqvSh/Il5uR3SL9JPWEr
	LtOO0LLh0dXeEsnukoRHb4fSQwELWgQ0KLyQzyfD/liMxvr2GKkm/iRsObPGVvyj7nwfv5c
	KaiZTCwm9Ouz4UHPRAxyw0/aLmy96mbYS8XLIzX+UHMBGvqIFY4amBADrXJDlnE9Am37FA6
	PmYZzORGBHOind0eoPvihVm/1PjXOchP45bNef99uLe0AHLMMI5jx4ZFJc1VpY4OYD429ix
	i11Gz/mTOrUE7xgzFu58L8k8BuXbd6sdSCmy8Q6o6z1hwroDk7BV09q37v0ygAQQQmp7XhT
	y3d3zMWpSXLHLxJ4YVr5+a5tzfhLUc7YHkzGF4D0B7LRfX58rUuU44oCy2akcHP41WLVeBP
	dYwH5bPzjyq5pVgDEjwZ3aaKWfLS/Xtu6fBV4WQg2DciG6b36bdBtH1R5ObaobRQKs0c4+f
	jVACNc1fJ30UZbTi3GoutBBTiV49UkaQhUaukKjV3O27lKwjGjdtMC/r2givIDsGjqtbDKn
	jzY1Jy3zNXu0GdH7FFADIAFt9nZvvfh2g3ycG1v5lUxY7KobJRmFer+sDlkEREsUzg6inTy
	WQYSn78zjy5luQa99stg866KBHq8BUB5PL71YSJLHssJDWJmWOZyPBYyUCTsm1fuaEe91uh
	U0f9KX/p93JZHuSBFEMHgeY3mv6hywWTJd9g5E6f/Q91M3fHw6hDlGeVUlCBF1WQ0vvyCOO
	F+rPyGp28xlW1Co4Y1Q08BM5ktovmZcdeXCbyNXZZVf+4MPgNNHdbd0ea7+e3v92TYHl+7g
	m/OM2RJ9CxTiKyNf6XSIzb6ZBUPgbndmbxnqzQW9SL0q3+izB1bpWnMueunBDimR1XawDpq
	i/QaSmsg4xz89ilKUrFo9/XAwpLYAI73Vhj5cSJ9ZE3IBrHcSItNpLV9RfCuER70qhRUfjU
	kckvIQu41l0nthfTtJ7WOrtDsD5IK4fsZWZKgI9OFFsfg7hCa/ZjrlUyHvDaFeHKAu6ChiD
	aiB1cR1kPLW/cY6DUm
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On Mon, Nov 16, 2026 at 02:18:28PM +0100, Andrew Lunn wrote:
> > link, speed, duplex and mdix are updated asynchronously by
> > the mailbox event handler, outside RTNL. link_lock protects these updates
> > and provides a consistent snapshot in the getter.
> 
> O.K, thanks for the explanation.
> 
> I removed too much context, so i cannot see here. What about
> lp_advertising? That also comes from the firmware, reported on link up
> when autoneg completes.
> 
The firmware manages autonegotiation and reports the negotiated speed
and duplex through mailbox link events. However, the current mailbox
interface does not expose the link partner's advertisement bitmap.

Therefore, lp_advertising is currently left zero to indicate that this
information is unknown to the driver.

If reporting lp_advertising is must, we would need to add a new
firmware mailbox command to retrieve the link partner's advertisement,
or add lp_advertising to link-event mbx alongwith link, speed and
duplex. Of course, it should be wthin the mucse->link_lock.
> 	Andrew
> 
Thanks for you feedback.
