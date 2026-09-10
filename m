Received: from mta1.migadu.com (out-74.mta1.migadu.com [95.215.58.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79BC3BBFCB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789020579; cv=none; b=U/+o097eNywxgIDmBZILGMkbGXdYxPRc+TOdpC/KT2Noadp+/G4P83e1sqz2yTs2++zA7g5SgQm4+q2CJW9vKrbbHC8FE5pBQFaSssQeo5tFDA3lLLMQefPqOVoic0zXvuPlf7Hk4XJCPQz4YvtRCTwE9uTrpIHb9PCtzEmvlIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789020579; c=relaxed/simple;
	bh=3HCylPQKsJ8fUNFwZtSlf0bSntqmGVxL++6F/eBsEyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=sWemfINyOVHQVMp9ug0h+x2G5YjQh53no6LjARijieDMQYtYcl2KhUGUWWTHM1M5dD0/AQ5k41e9+K4Otkkb14rS4xUQNa4yfIRiIGgo25hxqXtcx/UHhwv2LhWy5jiJx1dBQX4q9kN7PGHaZoNAf+K0hUlJmONoE/giTSoJqAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=L8QyDn1Q; arc=none smtp.client-ip=95.215.58.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="L8QyDn1Q"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3HCylPQKsJ8fUNFwZtSlf0bSntqmGVxL++6F/eBsEyk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789020571; v=1; x=1789625371;
 b=L8QyDn1Qd8n/FJyv+GV9OzlhPalzt1jsli34lLcS0tMGJfhbTYHL+wpKwALnPaaU9zyO4Z/w
 jDnBzBEStfPXGSxUVefTGvuZIr7fcdF+Y3GVSagXAcrZ/ZcJZwFJdSHnv+Eg8b/TD70RaxdS4u3
 0XyK/F598Wba0WvFBCLpcd70=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 11fc99cf0e5798a2;
	Thu, 10 Sep 2026 06:09:30 +0000
X-Mizu-Trace-ID: 11fc99cf0e5798a2
X-Migadu-Flow: FLOW_OUT
Message-ID: <fa0181b9-d715-41c6-8086-af410ee4131b@linux.dev>
Date: Thu, 10 Sep 2026 14:09:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH nf] net/sched: act_ct: set net pointer before publishing
 flowtable
To: Qingfang Deng <qingfang.deng@linux.dev>
References: <20260909075606.1508155-1-qingfang.deng@linux.dev>
Cc: netfilter-devel@vger.kernel.org, Jamal Hadi Salim <jhs@mojatatu.com>,
 Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Oz Shlomo <ozsh@nvidia.com>, Vlad Buslov <vladbu@nvidia.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Xuanqiang Luo <xuanqiang.luo@linux.dev>
In-Reply-To: <20260909075606.1508155-1-qingfang.deng@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> nf_flow_table_init() adds the flowtable to the global flowtables list.
> However, tcf_ct_flow_table_get() sets the table's network namespace only
> after that call, leaving a window where the published table has a NULL
> namespace pointer.

The window does exist, but can any existing code path actually read
flowtable->net during this window? Could you also describe that path
in the commit message?

Thanks,
Xuanqiang

