Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF6D3EB0FF
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084072; cv=none; b=IdNmxChkQBmyvvQrjbCiMjbIig8nVZ/y84Qm/bqHXRsgcpEhn+MFoPI/DKSvXeQ/LX7hj1PIY1CaqKMfdNszhobu6J6YXnCFwq35wZ4hEYJWu2MIJtQLJkjOZD1xSAUHpz3V+V39eWy/MzoN3vBhHt3Un4ZqzbpntsNY5R7cZDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084072; c=relaxed/simple;
	bh=lPC+94GP1iL6O44cYFbZaSXrjZPnI+bXrSdgrJzSrQ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=reMyccfQKCZXzl1ed1gBc5xCOc+DN4LTtEkQJiz9IVdc/RBL2Kg71aBje7CXVG8yTquk3P33l83uJIcXiaV91623qeidfU4jG2T2Vrzb04/36NVRwUMGBn+cCdLfKqhhEoDFDBT1DQxnfWe7LJFnK+B679LhxV6DJMY9rTxI0/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4/RMukB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4/RMukB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792084061; x=1823620061;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=lPC+94GP1iL6O44cYFbZaSXrjZPnI+bXrSdgrJzSrQ0=;
  b=L4/RMukBOhoc4x6VAVNukceTWWKP3p/QpJ+bDlvi2SuFxl4ua0cb2qBl
   nH7K6tfPgRpZ6/L9llUyrhMqImtjq/Ho2IGmaZ7ITw3mh3KGuCHW1DMKb
   70mZpThavyZNQ8okfvVhW7rwZRu2mhKpIGdYgQs+nhbMaXlo+l3OL6fL8
   yMS4aXMWTN/zfZaF47x0o7yq8ZEFMkcg2UBQitAdUlllXiKcXr5qRFhVP
   UdahOZSsMKkstfZPu3drYF/We3xdjsAPBUd5kNc7yHz7rCxbPqNyd5q/6
   WwQnT1U1rJPuGKHPV47LDUqkHUJswe6qvHnwZbe8geVSsRTiAHpIqfhK7
   A==;
X-CSE-ConnectionGUID: cVejmLaCSwWhWsGezDJS2Q==
X-CSE-MsgGUID: UqhhtGUTR4y4+MCbw+xWyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="761463"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="761463"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 10:07:39 -0700
X-CSE-ConnectionGUID: xziUuJi+SLWE/oZM1lN+dg==
X-CSE-MsgGUID: 2T9JcXo4RtWXqgkA1TWqOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3573945"
Received: from unknown (HELO [10.241.242.105]) ([10.241.242.105])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 10:07:38 -0700
Message-ID: <711c6b0a86f88c4da8d209a6918ad836838e2dd0.camel@linux.intel.com>
Subject: Re: [PATCH v2] sched/cache: Avoid publishing partial LLC utilization
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Jemmy Wong <jemmywong512@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, kprateek.nayak@amd.com, 
	yu.c.chen@intel.com, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, 	vschneid@redhat.com, linux-kernel@vger.kernel.org
Date: Thu, 15 Oct 2026 10:07:37 -0700
In-Reply-To: <8105C521-9372-4E1D-8C2B-F44D9F8DD287@gmail.com>
References: <20261013084338.55100-1-jemmywong512@gmail.com>
	 <98a75f35d1f382e35f19a6cca87935ca41339c66.camel@linux.intel.com>
	 <8105C521-9372-4E1D-8C2B-F44D9F8DD287@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-10-15 at 20:00 +0800, Jemmy Wong wrote:
>=20
> > On Oct 14, 2026, at 1:11=E2=80=AFAM, Tim Chen <tim.c.chen@linux.intel.c=
om> wrote:
> >=20
> > [=E2=80=A6]
> >=20
> > BTW, I think this is also a candidate for 7.2.x stable.
> >=20
> > Tim
>=20
> Hi Tim,
>=20
> Thanks for the review and the stable suggestion. Should I send a v3 with
> `Cc: stable@vger.kernel.org # 7.2.x`, along with the comment clarificatio=
n
> suggested by Chen Yu and the Reviewed-by tags?

Yes, please do that.

Thanks.

Tim

>=20
> Thanks,
> Jemmy
