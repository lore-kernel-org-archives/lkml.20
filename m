Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66040474268;
	Fri, 11 Sep 2026 09:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118650; cv=none; b=K9eKKe7jGbBtpWRlkT/kBKcy26oGjD8pKkJipiKqvciV78IiBMizA6XQX/IX1Xn4IwnmSRPDuJ4ljaBw1LdaOgRFqj7d+f78/s1skvahIh2DEbV5B/JrJKBPTG88IcXFpMYm6We3V/HatIKwVzhPwUMwFAPA3yJYoUkpGU6s4eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118650; c=relaxed/simple;
	bh=zZNCMw5qwireJ1n96bJC6HsPS8Uf45fEqJ6iWqCu7Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KyLoxG0OzMNMyzehgTZoxwa9mahUGLaYcQb6CgmhY3Xlkvn+TkPMK5drUMcNLlCPYpTbnP8Cvo03WXBo+8S+YQJMwty8pTD5sjwsZyMwtO1Mtvcvb7P6+lLWCsrGNzn2rfPESINagbathhT6hKTHklClbWdXzW577RhZ8FLDgBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=CsHPZaTs; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="CsHPZaTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789118585;
	bh=kiiuHqrEyG2sfi0XTgnw+3zZbndj5N5xoXbOCeyPgsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=CsHPZaTs7bABcbOJEALcUsujJ9BKK6PdVORD1XY1qC1gRxYwLqECvNDM6I0En1Qta
	 edXRSOKFNI9DA/WvnLl2JcuAer6NvvpoZBTpRlzAK2BYWtn6UVQYlymsJ4crfinaQg
	 l8b4qxsj6s6a2v4sNHyX1o5sPWxelJgMBAx2jft8=
X-QQ-mid: zesmtpsz9t1789118583t1b547094
X-QQ-Originating-IP: QI8oySi+uhWX7uURhpzVCTXQv0Gqv6OZazMvN1UFgos=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Sep 2026 17:22:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10011258438961722049
Message-ID: <E53A82A427F8520F+9bd01d71-8b02-4fc7-be63-567c44b259de@linux.spacemit.com>
Date: Fri, 11 Sep 2026 17:22:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/14] gtrace: Add RISC-V platform driver for the
 gtrace framework
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-4-mayuresh.chitale@oss.qualcomm.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20260810152223.3946743-4-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MQ+wLuVvI2LQRFInGn7kH/zFg4CX6iN2o2um8UN5F+NrvReNVhboV0/K
	16KwME8J4As8B1h3sPyfux2yXszpUWehUX49L6AMvWJsg1gCX4/9SlN0T3p59ThQzFD1dws
	1IopFDi0pAJ91gSnm9ADfty5FyORrr/9kB725nqNk4PzNn7VXfbfMTk7u6Uzkfx9YsU5sXY
	0rnjXtpuA4MdbX4U4rC3SJASAxB8icyOqcFa0hpppvOdCUod4BB7+70f26Sfg0mvZwqCdQs
	KHCYH6qxuXBO0Pysp+QIso2IuM4WvzNXg29CtuPhusZlMWi/17D+hV1XEdJs7uL9zXpxrae
	jjjNfP3DqadicDT8VyS947P196C1Ugv/X9YE04IzKhSeafOA/pxYq3JL0PJw/TCDZeKEbP5
	jL16OT3E9tFvf90LKDzXueFIGnuF4PMeGjsbWml0HJWRzK2CZDPYjfB+qLD5Hp1mzuB8kxc
	+VjunUKf0CoDYFYMADTYSBWyRjUogmpdomROIZcWJGHyyKdp1OFpv1x77Tyk5ZjsRClg+5k
	kpS5m9uDFZGpdsvT248Q8l5Spkc3TZHvL6rM25V5onlFwYvHgLWZAMaoIcLQQVRtSsf13q1
	4TlqxLxc4aax31fFjzjxqIj0SRPmBxJ0P1Jixp7ScnLrzbCVDKrJaK1LJFxLoi2qHILvC/N
	QhAYz/4fejv9Xd0jXF0pIJRzbJZPh2o2lSXl5xsOrXWG+KJXrdcVnPp4qDNGLb+MRIxKU6E
	4I4MLuXdhg2x9SiJnyAOCUVqiT4H/cy7XYhVtgu4/37sQBqTBwh4ba/cfUH4gY7fzfCbv+R
	ygR2BR+gzdsIgy39IS4bu2sVKXTw2FjC9isuLndFpmn6Kpas7VDqvdtiBzc1ZWvxUgnydfg
	6KD80WX6h3BL0cEqAKugq7hEFD30Sz47E+VcF4eZy0tjQlzk38gnucGoDoCzIE4kkEvMVst
	cgsxnn5WagYwS5fm5IgGh0BhoF6x9Nyp3M1XWXEizfJdMNkbQ5/WCo6TTLFU9pv+Ynvx6l8
	cHN7tExzWiFnQB21Pdk5UQrPhsXhilY8fela2BDHWpaILgYcN2
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:

> +static int rvtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
> +{
> +	struct device_node *parent, *ep_node, *rep_node, *rdev_node;
> +	struct gtrace_connection *conn;
> +	struct of_endpoint ep, rep;
> +	int ret = 0, i = 0;
> +
> +	parent = of_get_child_by_name(dev_of_node(pdata->dev), "out-ports");
> +	if (!parent)
> +		return 0;
> +
> +	pdata->nr_outconns = of_graph_get_endpoint_count(parent);
> +	pdata->outconns = devm_kcalloc(pdata->dev, pdata->nr_outconns,
> +				       sizeof(*pdata->outconns), GFP_KERNEL);
> +	if (!pdata->outconns) {
> +		ret = -ENOMEM;
> +		goto done;
> +	}
> +
> +	for_each_endpoint_of_node(parent, ep_node) {
> +		conn = devm_kzalloc(pdata->dev, sizeof(*conn), GFP_KERNEL);
> +		if (!conn) {
> +			of_node_put(ep_node);
> +			ret = -ENOMEM;
> +			break;
> +		}
> +
> +		ret = of_graph_parse_endpoint(ep_node, &ep);
> +		if (ret) {
> +			of_node_put(ep_node);
> +			break;
> +		}
> +
> +		rep_node = of_graph_get_remote_endpoint(ep_node);
> +		if (!rep_node) {
> +			ret = -ENODEV;
> +			of_node_put(ep_node);
> +			break;
> +		}
> +		rdev_node = of_graph_get_port_parent(rep_node);
> +
> +		ret = of_graph_parse_endpoint(rep_node, &rep);
> +		if (ret) {
> +			of_node_put(ep_node);
> +			of_node_put(rep_node);
> +			of_node_put(rdev_node);
> +			break;
> +		}
> +
> +		conn->src_port = ep.port;
> +		conn->src_fwnode = dev_fwnode(pdata->dev);
> +		/* The 'src_comp' is set by gtrace_register_component() */
> +		conn->src_comp = NULL;
> +		conn->dest_port = rep.port;
> +		conn->dest_fwnode = of_fwnode_handle(rdev_node);
> +		fwnode_handle_get(conn->dest_fwnode);
> +		conn->dest_comp = gtrace_find_by_fwnode(conn->dest_fwnode);
> +		if (!conn->dest_comp) {
> +			ret = -EPROBE_DEFER;
> +			of_node_put(ep_node);
> +			of_node_put(rep_node);
> +			of_node_put(rdev_node);
> +			break;
> +		}
> +
> +		pdata->outconns[i] = conn;
> +		i++;
> +	}
> +
> +done:
> +	if (ret) {
> +		for (i = 0; i < pdata->nr_outconns && pdata->outconns; i++) {
> +			conn = pdata->outconns[i];
> +			if (conn && conn->dest_fwnode)
> +				fwnode_handle_put(conn->dest_fwnode);
> +		}
> +	}
> +	of_node_put(parent);
> +	return ret;
> +}
> +
> +static int rvtrace_of_parse_inconns(struct gtrace_platform_data *pdata)
> +{
> +	struct device_node *parent;
> +	int ret = 0;
> +
> +	parent = of_get_child_by_name(dev_of_node(pdata->dev), "in-ports");
> +	if (!parent)
> +		return 0;
> +
> +	pdata->nr_inconns = of_graph_get_endpoint_count(parent);
> +	pdata->inconns = devm_kcalloc(pdata->dev, pdata->nr_inconns,
> +				      sizeof(*pdata->inconns), GFP_KERNEL);
> +	if (!pdata->inconns)
> +		ret = -ENOMEM;
> +
> +	of_node_put(parent);
> +	return ret;
> +}

Hi,  

These functions operate solely on generic gtrace structures.They shoul
be moved to the gtrace core as common helpers to avoid duplication.
This is particularly important for mixed topologies where RISC-V
trace components (e.g., ATB bridge) connect directly to CoreSight
components (e.g., funnel, TMC).

Regards,
Zane




