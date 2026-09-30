Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A3A519DF1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788402; cv=none; b=oewueXBRs2E/WFdYZbkz3XtpgOw1hO2ZQ5JgZn2COfAdxp/BaU3PPB8HLIcuzE2/J1W5i72+xsx/iILbRpb8/cAyy8R/1kYGZ8J3lps/KT3rfP0kV8cdri88zmeVWptNExC/eVnL7C1rn3e7nvgMUPJh/BlzMNEYTTDdv6UHk30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788402; c=relaxed/simple;
	bh=mTbMS1Q6x0ikZ7WhZzFqZfSUagkt7vofDYssUYGqQKs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pcJLSUGXvLBu8hrxsP+i7xGOA4fuxZiEpA647c0NgEAaJ/OjVTDPfR7fZ2FCL/DDZgZiyPxGBiZqLtuzOWp6gwJsCB0ZaDpwOPStYwRTooxozUNTt9SQT3eyamsTunAqsbOnbxQFeeNXVeiBKzyjPxWRUgJYx+l7NYQUThSxMZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9GCeUXw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZUhvFA+D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T9GCeUXw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZUhvFA+D"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE04WO3942332
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIlPm6pWDwXvYMREQpH7upT+sWXfZsWEKBokElxA+N4=; b=T9GCeUXwxuB0S8FV
	7hamSltKIsDOypIJKVts7D13C1aYuJU0nUA6dP6NsWPFldrG4eCrcR/nd7Z42sCT
	Lw12RNy7k1N8b3kpBkyO2NS1wWHfCL5fPDoJ2dv8yX+uY+WHW+GynCYA/KDdK2QM
	a1b+IM+8jUAgSgMukGkHma/7gQzfXoOngSV5Xw9eH+caoEKmUZgWXlels+OM4IU+
	XDRkoymieASsHv5V6DZbcruNx15kSRrdfrTo86Dd2FEf28+nLiBSqhbh2D9JF20U
	7Y2Pa+ML8Qc5HUaowjQ2Hbz9bidKsJzoi3e/4rqmt/bMlb6ANn4+yZVGfPG407Od
	Qj8dkQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bk9w5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:13:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso9666118a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790788399; x=1791393199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RIlPm6pWDwXvYMREQpH7upT+sWXfZsWEKBokElxA+N4=;
        b=ZUhvFA+Dm2r+BniVP6xEemqsBFXJns7mmMbXJegdWQ2OBdCk554BZLLkhugFpG4KWR
         VYmko/MQah8DbRq6t2I+wNXcZFAZcMIa81DMmVMGJW/IlSpTViGdW29ALQ9Yh8Pq8yq6
         0Z90sUDGa9VxOl2CesUSB4q2icSpvOtfOn4L2MN3IcpDOrYu6L01PvhROtx5oXWx21A9
         rdSkmg1AH+bDXR43OzVVIiN8VusXyDGt0iBClGjabe2Md73YeJ6ju6tHEEyunud7Ruz7
         x0UGxTyJr/cEzu8EsjsnzFMcHWabJ9/4M5+S9tl5082tTcieHqBU0O/WsREVCXxyRWa0
         gwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788399; x=1791393199;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIlPm6pWDwXvYMREQpH7upT+sWXfZsWEKBokElxA+N4=;
        b=cznc0Z99lGj04/+e9utsWRwxc9jPSm6ksReEjV2JvXNB5ldf7Kcj4IbraESbdKA5VR
         5aCPuPRWtJ75WblioFzMoJ50fGCTOi3XCe6xBNQ2LStpdqaB3Y1VxH9cO2y/79Rranp6
         O5cJEraS07Imo1USNlcKNGS2JctI6Utsyn1Uo1viJ7xs640/K++a3q1KJa6ioRdVx3mV
         9nJqwRcg1oUnUv03wY9tzFf5b+9vOaa8LzJzx6VmQiehur4RwWk8ezwN4YyEeAWyZHM3
         c4SivgFXqX5ZFixYBVeuo9VRjJdrnIXk1l0NPDilYCt00NbMwoawr0DLcp6CJ16V1wj/
         O98A==
X-Forwarded-Encrypted: i=1; AKwUvBw2ILq6102ljkYAnZptpvTrI2aIVSkB/auHiiIpB/1EGjMGUtYUxxPdWo8LM6V8vJinTzABVuQB3NgHEY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmYGOT7J7BIVNlXNOJPO0qjKjge8Ii+ZDoSFPGSg6WdUpsZgbH
	fvvy55W1stDe/wQ1LRMbBJq/jcayvHuuUdlCMW2oE7w8bKAxGL8DW5ERqvbi/AyXtC3H4YnESDj
	PMFHIDJneg3DHfLqJ8dLgh0Zi1+2J+xYvIIBbyPjq6ICamzi5HDzJXVekJvnfesanTgY=
X-Gm-Gg: AYBFou2TRwyD8xPHpzxKSVoRQTZaxaEBN7mNZ/5yHN+o67Dqy6KAaigR28U/qpLSYrk
	JStu0YDxNAt6UYjtM17Ux21NlSiiMCoeycH2Zi/jKLW90hajNsu4PzIct9XTBLs8gIcHCY2gioa
	vnER8ECNlRX4CejGzHnJ+euW5yYo3wIWX5NBuRz6t3aHTmu1mtVaHM4J5eZfiwEFfra3O5SjhzH
	do9HnxHsQcTw/JPYTBuufSE13ObYbECEIX6wJScpsrO3ZUwvFwujBPIS4vcLGjwZGDGBK8yzpq+
	GPciEyLSd1xEdLdYniEZc3XqRhHKMhNp/4Nd71Sth29tJzxh625syrz/LmjShsdXqTtrg16BW/6
	XrCHQmIiUZQ3mwRUn4SAlY9MYouhLpmyRRgHt+HyF+8rFCwiymZVu/mc=
X-Received: by 2002:a17:90b:4a8e:b0:3a4:bda6:16d0 with SMTP id 98e67ed59e1d1-3a4d1913daemr1778292a91.55.1790788398634;
        Wed, 30 Sep 2026 10:13:18 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8e:b0:3a4:bda6:16d0 with SMTP id 98e67ed59e1d1-3a4d1913daemr1778192a91.55.1790788396385;
        Wed, 30 Sep 2026 10:13:16 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f478e750sm199420a91.13.2026.09.30.10.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:13:15 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:13:08 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier
 <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas
 Gleixner <tglx@kernel.org>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Hanjun
 Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Wim Van
 Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Robin Murphy <robin.murphy@arm.com>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RFC 02/11] ACPI: Introduce irq_get() for static fwnodes
Message-ID: <20260930101308.00002fb5@oss.qualcomm.com>
In-Reply-To: <arqSqcoWAkhy-8do@red-moon>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
	<20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
	<arZDwutoadki7tiZ@ashevche-desk.local>
	<arZNL9BnTGK0Klwc@red-moon>
	<arZS4vwxps01dGb7@ashevche-desk.local>
	<arqSqcoWAkhy-8do@red-moon>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kHI1nAO-HS3mH1Zv3q75gfHiUB4aAu5y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX6N2wtl9MgvhN
 R7V4Jwhb6rzKV78hHI6fkicjjzZSslctR9nWsJg6MIv+N28Mo30LHDL61j9gclP1/Kzl5NxpSF/
 uMGMIm9YZ/I/bDNI/0K//rhnCnCSs4M/paCPjihYuS19UAQBOufdLauF1ujUk3kSOli8RBTgRtg
 uaOualcr1XlexkB1OMYexRRJEpc/zwp+vNPNO1Cfg8LQwN0AazcSbkT35QzbLYwHcFFO0J2i8RR
 pO4IT/nV7LbyzYYWOgxA9pvg01rXXSfi1kEm3xTBPR9SZTKJBv31p4gOvj9gtLDPbX5uCZnJTKm
 +4s9FxrZJ2XrBx0p+gR2g00QmV+3wUwEJI7/jElLl2Z6zIP8C68+SwUjfSUMH/74sLzYcXyTf8c
 3zVSe3J92EcrppvP6j2MOQMOmCO1IV+aqk4IRVLO7oH+Ib/0G8tZO3PV294cyeQlq4GcXw3Skky
 QYDND86+dx6J+NeeG0w==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abd432f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=u08uBHW3MJJG4PD1gAcA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX7FaI5pdHrJRR
 Y4TXyQe/a2VT22L+4osZIg8GQ+4MKR27c/uFqBETRPJDjR7qayN410p1rDpX0uk6HiNFLYqho4E
 eJPjp6aRqD2IJ2foei6FkLwFPhMqg3w=
X-Proofpoint-ORIG-GUID: kHI1nAO-HS3mH1Zv3q75gfHiUB4aAu5y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300068

On Mon, 28 Sep 2026 18:15:37 +0200
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

> On Fri, Sep 25, 2026 at 01:54:26PM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 25, 2026 at 12:30:07PM +0200, Lorenzo Pieralisi wrote:  
> > > On Fri, Sep 25, 2026 at 12:49:54PM +0300, Andy Shevchenko wrote:  
> > > > On Fri, Sep 25, 2026 at 09:48:01AM +0200, Lorenzo Pieralisi wrote:  
> > 
> > ...
> >   
> > > > > +static int acpi_static_fwnode_read_u32_prop_index(const struct fwnode_handle *fwnode,
> > > > > +						  const char *propname,
> > > > > +						  unsigned int index, u32 *value)
> > > > > +{
> > > > > +	u32 *values;
> > > > > +	int ret, count;
> > > > > +
> > > > > +	count = fwnode_property_count_u32(fwnode, propname);
> > > > > +	if (count < 0)
> > > > > +		return count;
> > > > > +
> > > > > +	if (index >= count)
> > > > > +		return -ENOENT;
> > > > > +
> > > > > +	values = kcalloc(count, sizeof(*values), GFP_KERNEL);
> > > > > +	if (!values)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	ret = fwnode_property_read_u32_array(fwnode, propname, values, count);
> > > > > +	if (!ret)
> > > > > +		*value = values[index];  
> > > > 
> > > > Use standard pattern, id est
> > > > 
> > > > 	if (ret)
> > > > 		...
> > > >   
> > > > > +	kfree(values);  
> > > > 
> > > > You want to use __free()
> > > >   
> > > > > +	return ret;
> > > > > +}  
> > > > 
> > > > I believe the whole approach is suboptimal, if you wish get indexed value (but why?)  
> > > 
> > > Why what (that's what the irq_get() interface requires ?) I agree it is
> > > suboptimal - the whole point of the series is an RFC on using properties
> > > to store GSI number/flags, then how to read them we will optimize it
> > > when/if we agree that's the approach to be taken.  
> > 
> > Why to have indexed APIs. The callers usually do not want a single item from an
> > array, they want all of them or a big pile (exception is the array of strings,
> > but we have matching functions for that).
> > 
> > As per approach, this patch is against device property and I don't think we are
> > going to agree on the approach taken in *this* patch.  
> 
> Coming back to this, what is needed here is a way to stash the GSI number,
> flags and name in stardard storage (like OF nodes IRQ properties, ACPI objects
> _CRS, etc).
> 
> To give you some background, I thought about adding an array of:
> 
> GSI [number, flags, name]
> 
> to the ACPI static fwnode itself. Then basically the irq_get() API has got
> all the information it needs from the primary fwnode; while doing that I
> thought that this might have been a bit like reinventing software nodes
> (granted, software node properties are ways more general that what I suggest
> above and I don't expect any other property to be ever added to static fwnodes)
> that's why I put together the series as it is, precisely to understand what's
> best.
> 
> When you say "against device property", what do you mean precisely ?
> 
> I suppose you mean that this approach goes against software node properties
> usage guidelines ?

For what it's worth I like it.  Clean (ish) solution for a messy problem.
May well be some details that can be done differently though.

Just to provide a counter point to Andy :)

Jonathan


> 
> Anyway, again, it is just to provide some context, we are talking about
> a bunch of platform devices, it is nice to have a generic solution but
> it has to be simple enough too given its scope, I understand very well
> your concern with this approach as-is - it is there to find a way
> forward together and show what the problem is.
> 
> Thanks,
> Lorenzo
> 
> > > > it needs to be retrieved as that in the guts of ACPI. Allocating memory for the whole
> > > > array to retrieve a single element is simply wrong.  
> > 
> > ...
> >   
> > > > > +#define ACPI_IRQ_PROP_GSI		"linux,acpi-gsi"
> > > > > +#define ACPI_IRQ_PROP_GSI_TRIGGER	"linux,acpi-gsi-trigger"
> > > > > +#define ACPI_IRQ_PROP_GSI_POLARITY	"linux,acpi-gsi-polarity"  
> > > > 
> > > > Oh... This sounds like a big ugly hack.  
> > > 
> > > That does not help much I am afraid.
> > > 
> > > What's a ugly hack ? Property names ? Using properties for this purpose ?  
> > 
> > Yes, properties started with "linux," for some core functionality.
> > Yes, using properties for this also doesn't sound right. I think the problem
> > here is in the table specifications or somewhere that deep. That's why we
> > ended up in this series.
> >   
> > > Again, it is an RFC for this specific reason and I mentioned that in the
> > > cover letter, thank you for your inputs.  
> > 
> > And here we have a discussion started :-)
> > 
> > P.S. Looks like I was too quick to jump into this thread. I will wait for
> > others to share their view on all this.
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 
> >   
> 

