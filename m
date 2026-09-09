Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C571302753;
	Wed,  9 Sep 2026 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942936; cv=fail; b=f2F5eVuJq8L9DDgOr1rxb8LLCmTBaHqSoshUTMgitZCL/goBVSBJ3aJSElXO/vMTRUiWEsiVcK9WipJbiHgN4RStLS6OLkgBB1Ob3pLTWFPTpQYkGVeWG1i8wLepfUmME9XavfPIq1KhW6e7b0ihrJJUmjhhbt22mRJNlSsvizw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942936; c=relaxed/simple;
	bh=46b063hco25yKIfB1BRmCAtaJreIcR1a4DzT6aqJrEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOyrN/9fd3vJ0CC8qJ6WOKyKwi7h6/AMYjoeH4be4uzw6BEzlHrhGn5kTbu4vyBh0dng9UbICDivSmITrItIF0krB3oBfiLa42R83I4ZYgtLYC0hMomcdCRcHf/nmlqoO8VFj4I41wL/LESL5vLTXZ8pJlU/FktcaKKvyXPQdo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oGErQq6g; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=A27xEEdd; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oGErQq6g";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="A27xEEdd"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6893mxpK584136;
	Wed, 9 Sep 2026 03:34:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=QL9fJrjfyJIZU//d0G
	CDBtnnXf0apsdMa1nJJRAEOMQ=; b=oGErQq6gSKVLdBxS8lsMAw0Q7H3cunE4fX
	gvW0kac0SUoMcj+TOV3FnZrIiiTSlJrivfhPt5V01N2FN/RBJ1k9N8/D2/2r9+N6
	XvSSVic3PGu00Ofickw9tqdcT7lrYStrMKXdT1o7EKmMN0meW0KhOszQIcwaPPa0
	h4tt3Pw05Et+4eNvQ877mWYEitt9ijCxK5KdKfe7xhz/m2JOfik+ecrMo3xy2Fzw
	BD1PIYGu3FhgqCDPljl2mVpBoI1/pJP8KNp6t/NWmUHUyuXFN6+O6KFFX56yEuin
	6ysX+yhJyjG06UXHw70IpCLc2rpssC/i/aKHs4TN32WIFpgp+0zA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021079.outbound.protection.outlook.com [40.107.208.79])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ggfgjvqjh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 03:34:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ys7d78D9RxhZ9izXYUjPDKi4QImu10kMIpXu5vsz7kvaOjqGyM4kJdzASGsKYY/lawkK4X+9kIPEix6/aslNhog/uF1gR/bLlFbbQKzIQusZ9GH/642LJ2hhsgTzUccPxJfZv2LvWW88y8+PQNRxMMQ84rYbrFEASYD2A5zQQpQ49/Ti8v6McDhicv4Y9VYmXj4EjFCiEH98AaKwehDps4oH2v6j7p6EmMSQQ2kKeri2GWIHYQX/yeZDfJ9sgSkmanZGamZyM4SdvsxTf2ync1cKAh5XUUwxOMOj1x9ByqY3ZsRvi4lBIH0fwvP+ouRTVzvrQQc0s18N7ni2LWEwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QL9fJrjfyJIZU//d0GCDBtnnXf0apsdMa1nJJRAEOMQ=;
 b=bf4N3u9jMag9xBqbxMs3D7IufurCmV8Ml9CQgaXUBvYPyjAD5uYa0GEOMz1oL62vtJ08gXnyMPBRO1OHCFKmBcj/dCUGGJrm6c8vQATqsASGrbPZjx8I0aoxDaN0giPPoyKh+xgDwe4oNXIQ2MCIWoAWn0iAUpVeZlZaZhyQfD3uDhZ31/DvfC1ZcIonbgWlQvKyhbvdLDSCr3qLDwr902LXUN7JRr9DqJO/oM6LNKk8uxge3LWChphz9Lqp5ZLSI77wwr6A0e10HrH2STX6FhnH8TNBX569tBrx7OkVeqGtuA1RtKv+EZxreLWzD3JRm1Aj9yNJkqHIvsLb34XAjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QL9fJrjfyJIZU//d0GCDBtnnXf0apsdMa1nJJRAEOMQ=;
 b=A27xEEddpmcpjAiuQxaJ6ovUeXtUwHNoyyxZyGWN1+DHxoyxdl9bSSTcK13hZefbAw7K0qtlc+ZaFG67aqDjSyMIatrGvTWA96VEfoYd2GsrKAsjtBSnYAHo8dW/5+19Q93ndbAiv8VW3Ax8SKiitKcX1rPwgQbnl2+ZVMtbAso=
Received: from DS7PR05CA0078.namprd05.prod.outlook.com (2603:10b6:8:57::24) by
 DM6PR19MB3995.namprd19.prod.outlook.com (2603:10b6:5:24a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.6; Wed, 9 Sep 2026 08:34:10 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:8:57:cafe::7c) by DS7PR05CA0078.outlook.office365.com
 (2603:10b6:8:57::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.5 via Frontend Transport; Wed, 9
 Sep 2026 08:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Wed, 9 Sep 2026 08:34:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1C9AA406545;
	Wed,  9 Sep 2026 08:34:08 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 03FA582024C;
	Wed,  9 Sep 2026 08:34:08 +0000 (UTC)
Date: Wed, 9 Sep 2026 09:34:06 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/11] ASoC: SDCA: add populate_function hw_op for DT
 function data
Message-ID: <aqEZ/uv3qzlzt4pe@opensource.cirrus.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-6-srinivas.kandagatla@oss.qualcomm.com>
 <aqA29pv18mXzTR0G@opensource.cirrus.com>
 <f1e80aa7-2d92-455c-b7d6-484fb353e01f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1e80aa7-2d92-455c-b7d6-484fb353e01f@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|DM6PR19MB3995:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dbb1ed8-074f-4048-3922-08df0e4d1ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|23010399003|7416014|376014|82310400026|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	pNoyke4qb39t6Csiy7RyP1uVxBBdMBCuc1qmD7hBmFT2us3USTOfVFhMHk/EgJgZA2mYzed51+qS+cl/EFVE1KFcZAK9zfqqMsp7zJG2vXyu7Xl2kk+QknXA6rOxiPlU39AbLzCbLP1qia7C+/ssLXnGWS67ayUvL1xXaY1dx2e5AZ7EwhAgm/QmDHt4dtQvzPaBqjGK40dncBinlOnN+kLzEBaa5Q0U8u0ZRs8AvzRphgx23SjVAEr4Oc9Ap55PX6tkEvmVaQBqlHPgJIx7x2MpALwgbqPgOBXUyb2nsBmeJpm4tQbY3yl0/xFw/L+KdDTpjeuo9B9nt3QetZPGr4WjgrpwgjbP/t+vDCH3+N1iIVlR2Wf4yj75fIxN0UkvNhecofPjsRFB7N5fgGt2t4pqflJAlsDZ61V3br9pudfysy7R8N16HiDo3P/G6+qQny+VHh3n5WdSpRev0kV8LuHxXB7duDivB6+Mjb07jjt8Y0SQfplOVs6ibUxM+XnlDaVVLw0xnkfZy05CKscimyLtxle39MStyWGWVcBWy+rwjry6PyQw3nRsxbh8IXCx/K8rqvmaoJd45OKZe2WdgfJuLoGBZejdwqdhn1p0ogBoBmLrteb2Oq595pV10uphhU0DoU88oz8OutWWjFFRcMPv12MZUA+IP0EJqGr4jKuB1HdLm+9HWp0FdDjisp697c3aZqxD8AY3a1XlQgQUIg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(23010399003)(7416014)(376014)(82310400026)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m1+JE4xlyEYNkpYwsjaoUPyF8YQ08jjGlZQON6b9256UiclQLOMTP24k1sa+WwkyRP4Swqs2vONI89cKROVYu/ZP0NKE0lahuBK5whj5ocHt7tYUjluQTn8TX3ugS5b3Iv8JtypR+UpAEcc3+kSRTcWomd46i3IZ7mOuFhlA+7H+a4kP669GgScQ5yWCh5oPk9oQUsI8loK1Q3Iq8p/22Fjta49muAhd84zHXCG0Dub1+uKtsHS3fS1iljD9bx323Cuk7nflpzWyPNvpsmNK+a+7JxTaoVyWJSZ4xzQkce3eDP51OMnQfKaamjUWBDWzPXSTs09+a2eOcg4LpwNfN7OiU9/ZbKD5jq1Y57Fi14PSCYIuBdN2PdfqpMoLX47h2GIFHiHFPkvhkZ+0krFfsAQ9F8DNspY45a7iZhiSG2kWJblKhapXbOrncRAnLKHl
X-Exchange-RoutingPolicyChecked:
	oJDgubtH2AlL+5fqRpz1v1NdTise9+vyqODYzAiOhcsXPebE2s2IlKQfH3t5UXscnUmgTjM3ml6kVPpgolpyRezCo/cXP7TKp9p154zEZBFlAugi8ArLhWtWfO2nT9w0sUIciTK1ovLtoA0YGd7fRSt37Rad7OWXzPvgvYtp+h2WP+FbdXBqXcUS4/KySeJV0998gMhr18dqXqA7NVcTisLK+lCS2Mftz2SzVf/zo3e0VrmFUSu2Qo2WTpUhQDwbJPyuLX15PXMsrodoOEal4P5inidpzpV2FTaqlhb3uulsEBfFFaowErFMoFfHpGjXa/NqDoup5wnYmap9zCGuHA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 08:34:09.6372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dbb1ed8-074f-4048-3922-08df0e4d1ea2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3995
X-Authority-Analysis: v=2.4 cv=bpd8wkai c=1 sm=1 tr=0 ts=6aa11a07 cx=c_pps
 a=OrhHz3+zTO+bBwkwaozMtA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=dz5TL3hxkjpnjEL6Y5MA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NSBTYWx0ZWRfXy6WKFVJDs9z1
 RJ59Q/lnZ/Wp3qZXTOsLYJ5C/30cRKDG+AdkdYVHzSZuv68Hd+QAseKpt0QL+4qwudYggwi8HzV
 OezC/idKQqzY4ONWBuOVNxc77C0+zRv5BWZ4nC0RpvxEbHk4o0RcFatFlojsR+aBP/Ub+u5efIB
 SE3D/EJFgXuEnxcCBlkyY8o5jD4hS+TbTgLoKTzYpt8HZ+6JH3KBox/hGfMXibsJVhoR9exbF35
 KdEAOPUMFa3LW6l35OawCVlyGH0EWcawyMulUZKox9MFLUJ2UT7gY4ppG9nzxDRwnUV5y7XxZrx
 90PBPVpI/19NBoutHc4P1NKc/qBN8OVPVm6XgKrulf5pNUXHwJ3CiMrT/nAsLtBKqrlqBLYqrhy
 oDSBBT2YX3ZAYcx9HoepLS2PhJhr0W5gWFR4bBaN6LJKIKedUidyxydMW2HR/0XPMLkNyoW/Fqq
 tIGHcliGQlXn8Yy5BLA==
X-Proofpoint-ORIG-GUID: 2T7Wb-3rYp8FxDN0XD6JSWkDMUa3vEOv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NSBTYWx0ZWRfXzyGWo7k3Rc2J
 McAlhd1wqaDDp81y11t0m9EL0FA2eKWmkPt8tK0jQD7ovIagmKDXgglMnNxskqQ4x/Z85Fi+Gwu
 5X/eRaD0U4FipHC0iltf1Mhj+xerJ88=
X-Proofpoint-GUID: 2T7Wb-3rYp8FxDN0XD6JSWkDMUa3vEOv
X-Proofpoint-Spam-Reason: safe

On Tue, Sep 08, 2026 at 07:00:22PM +0100, Srinivas Kandagatla wrote:
> On 9/8/26 5:25 PM, Charles Keepax wrote:
> > On Mon, Sep 07, 2026 at 09:37:19AM +0100, Srinivas Kandagatla wrote:
> >> -	ret = sdca_parse_function(dev, drv->function);
> >> +	if (drv->function->desc->node) {
> >> +		ret = sdca_parse_function(dev, drv->function);
> >> +	} else if (core->hw_ops && core->hw_ops->populate_function) {
> >> +		ret = core->hw_ops->populate_function(core->sdw, drv->function);
> >> +	} else {
> >> +		dev_err(dev, "no firmware node and no populate_function hook\n");
> >> +		return -ENOENT;
> >> +	}
> > 
> > Is this the right logic here? I feel like if we have a
> > populate_function() callback we should call it regardless of if we
> 
> something like this?
> -------------------->cut<---------------------------------
> if (drv->function->desc->node)
> 	ret = sdca_parse_function(dev, drv->function);
> 
> if (core->hw_ops && core->hw_ops->populate_function)
> 	ret = core->hw_ops->populate_function(core->sdw, drv->function);
> 
> if (ret)
> 	return ret;

I was thinking more:

if (core->hw_ops && core->hw_ops->populate_function) {
	ret = core->hw_ops->populate_function(core->sdw, drv->function);
} else if (drv->function->desc->node) {
	ret = sdca_parse_function(dev, drv->function);
} else {
	dev_err(dev, "no firmware node and no populate_function hook\n");
	return -ENOENT;
}

Although noticing as I do that it is also a little weird the
populate_function() callback takes the soundwire device not the
function device as an argument. I will have a look at the wider
picture on that.

Thanks,
Charles
