Received: from mta60.mailii.org (mta60.mailii.org [78.129.155.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC7225392A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.129.155.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707613; cv=none; b=rvWzcp+fax2fvO93AeWTrQds8i8KzsfQPqo1R8NREtG57ifSDQV0oPksJcBp1g4uLXT8bj2DMFMTnp87XI15/4Yn2nYoYBcOLAkw+ZvLtoO9ds9gb6ELcTnew2LrnwG7vRXHsn+7EvSG+DLycqEmCRW4zzholPZEpfr0oB3JXxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707613; c=relaxed/simple;
	bh=5BcuclSv2CC11HeMfuLEgsOS0onZ41ycm9dJjHThZ3c=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Rnm9sB6SFb/52ZdIK0JyltNOu/mP6nC2S0iIHmKKDdqlxeg+P01VU5qjqTBHK2Y6lsAYKMnx1vBq9C0H07BJ3eDJFEKSpvgxG6nCy4uARGRQ/1JFDndRm2M44ShfGFhsCyANe8MZcx4cWE8URG21whC3wjU2uNnRDgan0pfIFiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hajimohammadi.net; spf=pass smtp.mailfrom=hajimohammadi.net; dkim=pass (1024-bit key) header.d=srs.mailii.net header.i=@srs.mailii.net header.b=JsvPkHHG; arc=none smtp.client-ip=78.129.155.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hajimohammadi.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hajimohammadi.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=srs.mailii.net header.i=@srs.mailii.net header.b="JsvPkHHG"
X-Mailin-Tag: 95.217.242.122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=srs.mailii.net; s=mail;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=5BcuclSv2CC11HeMfuLEgsOS0onZ41ycm9dJjHThZ3c=;
	b=JsvPkHHG7r8CHAoQLZkDegsBnk8+VJ6P5jIVrinBZGwPIfDoxRdqA3QUMMVsZ3qNR5aHdE0Hm+VBu
	 lyuvodzLHBwEV1wMi+E6eL3KgrdbdEtuKIZ0OPNcNf92IL9UhSArgItZoG0XYhvHklwUp62TO/GEQX
	 TbTm1rdJR1G8lyfg=
Received: from linux1de.centraldnserver.com (static.122.242.217.95.clients.your-server.de [95.217.242.122])
	by ukgw.mailii.org (Halon) with ESMTPSA
	id 3eab6364-bc2b-11f1-ab49-005056a23964;
	Tue, 29 Sep 2026 20:58:55 +0330 (+0330)
Received: from [78.154.57.70] (port=64672 helo=smtpclient.apple)
	by linux1de.centraldnserver.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <info@hajimohammadi.net>)
	id 1xBbdO-000000004D3-14xf;
	Tue, 29 Sep 2026 20:58:53 +0330
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v3] staging: rtl8723bs: stop overreading monitor interface
 name
From: Amirhossein Hajimohammadi <info@hajimohammadi.net>
In-Reply-To: <2026092915-luxury-shush-6b29@gregkh>
Date: Tue, 29 Sep 2026 20:58:40 +0330
Cc: linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <D45E885D-B05E-4BDB-9AB9-D5AFD5E82F47@hajimohammadi.net>
References: <3B4B0B72-4DCE-4E40-9E87-732DCBAA4EAF@hajimohammadi.net>
 <2026092915-luxury-shush-6b29@gregkh>
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)
X-YourOrg-MailScanner-Information: Please contact the ISP for more information
X-YourOrg-MailScanner-ID: 1xBbdO-000000004D3-14xf
X-YourOrg-MailScanner: Found to be clean
X-YourOrg-MailScanner-SpamCheck: 
X-YourOrg-MailScanner-From: info@hajimohammadi.net

You are right. I noticed this during manual source inspection and
incorrectly treated the fixed-size copy as something that should use a
string helper.

I did not measure any throughput improvement or test the change on
hardware. The original patch was only checked with checkpatch and by
applying the received email, so it is not sufficiently justified. Please
drop it.

On rechecking the code, ifname_mon is written and cleared but never read.
The appropriate cleanup is to remove the unused field and its dead stores
instead. I have compile-tested that cleanup with W=1 against staging-next
and will send it separately.

Sorry for the noise, and thanks for the review.
