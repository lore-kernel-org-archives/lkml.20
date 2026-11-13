Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590550;
	b=nYpb8U/8qBUwV6wXEA+n/5laqFZ/G8L+eJjJYfO4MpcglUuW+YA73p1LjtBpPq02OOXf
	 2pmg43IfDYhy29TZSUgJDMHX0/r7nsPzQfUPvL/w1uvqxqnFrp5lSsZKKI80/ZhquU+/D
	 f4Z001njQOcdeZWvextuU1Uft+EtxVmo7UxqR1YlUw2W0Rayy0y0jbWLHk3N0d+n6Qbe4
	 VFQXWQTeYAzde7aRhTV0YIbcx3j+2f3zPvgVx9ndwsuIgkEBByHm2yngWpGq1XuK993Fd
	 TmcYDKvpxNkiXrTity9IUR3l3uhxZqDhyltnwbwGb+Wc3y+PDXDi4YJM45zIKRq6UCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590550;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=fHukDD0UbvmUT77AtdgTmVuLRMj4asR7tQ0Y9WypVT0=;
	b=UVS9ioGCUGzbS7ecL9l5AZmi+Dq4TRPOQHhqZ5OFsaFiM2A4i8McwovCH9/4x1u3k4Ow
	 7Wtr+KHGZEsM8dkw+jul69T/2FpDl3RlA33/xrIPU2ac0BQgcew3BauG2wMvORnU86iTl
	 tm7v+ofEN5hQ+WOp0ZSdATbyA8kcMtz98yAM91Dgdl1KuGZfiMz9iEriWQ73xPw0J07eK
	 rrd/4z11GnjelRBlTjc8mFnyO8CBmDuKDq9+dihaPD2h8G8mg4IrrDasTyvZumpayg8W2
	 Z/mex7RsJni3HnPtFs4h1eNagkSXjVI0QC+HQYWlB3csMrIChUGxqeGS9ibMKDLlSQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KRcjhF+R;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OtW9r7JX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D560A606BD07
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D560A606BD07
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KRcjhF+R;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OtW9r7JX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794590548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHukDD0UbvmUT77AtdgTmVuLRMj4asR7tQ0Y9WypVT0=;
	b=KRcjhF+RtPnWX3GsI5skqntxmM0vHfqxVFBaRIAMHiglw7l5fvmshDNlkEcxnXX2sGhmEn
	1LGqslG4j2Ha9ldDyoOCdacOqOjtCppDXtqyObg+okfSoVsFOSY7AdDkXIjX/8SH0Lzt2c
	YwM2L7y8GWeHknfZbzILuN0XDElmMqs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-_WyNp5hvPEq8Fsj7eNqMwQ-1; Fri, 13 Nov 2026 12:22:27 -0500
X-MC-Unique: _WyNp5hvPEq8Fsj7eNqMwQ-1
X-Mimecast-MFC-AGG-ID: _WyNp5hvPEq8Fsj7eNqMwQ_1794590547
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536720195ebso24774531cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794590547; x=1795195347; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fHukDD0UbvmUT77AtdgTmVuLRMj4asR7tQ0Y9WypVT0=;
        b=OtW9r7JXbnyn7IcLoiUeJRRYwV30QCLlQsmVB600ewBp4Lvq5aeqQ2mrVwNpR08wb1
         e35g2VxQ1d7UhLAJVUu8qY2dZ47ZUhilAh8bmL1Rn9b+S5iffMzKVk0O5offhoYBw65Q
         5e9wVmEvCOL2PIPyVrDnKcXzUFNB2nFJ5j53Qh/Wu7R7vk/TC25TjVrRtJ1Vc6wts4Ic
         oRYgYHSs5j0IM5jXk3rcfn5fYR12DPDDm6eEZJzIQZILfYYgGLJ21ZzN4GEYjs36kseZ
         hCVclv4XM2DPwoheGQKqIkezr8r5g7bp0UM/zFi2zR1ElMe4AAVB3HLuDaLP9n3xcWqI
         tCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590547; x=1795195347;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fHukDD0UbvmUT77AtdgTmVuLRMj4asR7tQ0Y9WypVT0=;
        b=Str8JDgSBpWxCZVIERE9V4UUgqGihhz8YEoq7MyRM6Y7LwlkvrCqcphtk19ZGtbzyf
         +7hg4H4afX131MjaTmnVul5SX7DyqSPQcTZrelACpSL7PCaESSDz0hMIquD9mPjt7h6l
         FcbVPPW1sO9N2bax2uv3ZHQtsY51oztTrByJd82W3oAqIPKnwm4Feom2K+hs/0Pp34J3
         tUqV2bpMDRIFeCS9yccvrWh66ABg1MoIKviPPGdYgi0WgegT4o5ix6aF7it8qrFRuBjZ
         VZU9+VyrGhlrmTSmfStAimqPXHRJcuJb1UtrIuoRiTGbvbedmmz1jztunegb8fPXhkEt
         z/JA==
X-Forwarded-Encrypted: i=1; AL+hErGfdsLpMrihGAgZQVHTVlvnZvp2vl+ujZTSwcAmCc2kTZ8JBW0+2ZULz4rVMOXobRU+/yH7YtL8iIFfGKo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xi30X2sEv/bfvYCKwYf9cZzKWrmOP7KFPM0IQlhlI03tPtrME
	CqiQxi0v6HGvmjj7igbYkd3xzcCSyfhyICLa+wyGx/Z6pOAA2MM/smz3CAT8UvIfA2DrvGnmQYc
	/DR9XnaU1SnuwcWLEWb6RlYSImhhhWrFQwMC+PpMpX8xVRkf1yTq2LE21itCqGn8N5A==
X-Gm-Gg: AYBFou1/MetQ6+J8ihOYJQrwvtgNPfNBdlDf8OljeFL5baCqyt5/FvAha1ehb4rKs8d
	yTW0q7R6Rt0JwWFc11Ih8Fef2XyySZyZQa15efktDqb3FLBNgt1C9wrzz/gK581D38SsisLdN+v
	j3ySvPJtXxlAOP01GVD2KEERJ5F6cNC2zlWbq0/CrRDAGMa8VYr/+SyIp98ePOSgiUqVZ9XzdnQ
	wOQKPimMDUyeHO/VJeHGZw++ujZPrjOg3dcrvsh/68CO9v5c2uzxpOaVpwvf/hZHLPKFDF6dk3c
	K0CUdN0/GVJp2fWURNjaTOOayBgP+RYX+a9AgPDN8uuJYas8fjKVERnMdmXDR9vivinT+2Pn5Ca
	5qaodqyqOq/bCRReB0txKMvtslRVcVEofk5tw99kbcdabTjgb3BC0bzMjobnc79zU/54jG480RT
	5fGxDWJt8KWbO2dxo89GGopNtt4xQcaj44UYbfut5H
X-Received: by 2002:a05:622a:550e:b0:535:70b4:3f7c with SMTP id d75a77b69052e-55ac937d6e5mr45976401cf.66.1794590546851;
        Fri, 13 Nov 2026 09:22:26 -0800 (PST)
X-Received: by 2002:a05:622a:550e:b0:535:70b4:3f7c with SMTP id d75a77b69052e-55ac937d6e5mr45975821cf.66.1794590546274;
        Fri, 13 Nov 2026 09:22:26 -0800 (PST)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad14f1ecasm22347291cf.24.2026.11.13.09.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:22:24 -0800 (PST)
Date: Fri, 13 Nov 2026 12:22:22 -0500
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mike Tipton <mike.tipton@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
Message-ID: <avdHTgDnTmQYy3CN@redhat.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
 <179275170360.4070168.11650113664838519061.b4-review@b4>
 <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
 <825fbfbe-a9a0-43e2-bb54-f9e38ce779f4@oss.qualcomm.com>
 <179458337623.3308909.8679910347462508471.b4-reply@b4>
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
In-Reply-To: <179458337623.3308909.8679910347462508471.b4-reply@b4>
User-Agent: Mutt/2.4.3 (2026-10-09)

On Fri, Nov 13, 2026 at 04:22:56PM +0100, Jerome Brunet wrote:
> On 2026-11-09 15:06 +0100, Konrad Dybcio wrote:
> > On 10/26/26 2:11 PM, Konrad Dybcio wrote:
> > > On 10/23/26 12:35 PM, Jerome Brunet wrote:
> > >>> Preparing a clock protects its current requirements, not the resources
> > >>> needed while changing its rate or parent. A transition can temporarily
> > >>> use both parents or access an unprepared clock, and a parent rate change
> > >>> can cause other clocks to be programmed too. Raising resources one clock
> > >>> at a time leaves those operations exposed to insufficient power.
> > >>>
> > >>> Failures make this worse: hardware may already have changed when the
> > >>> operation returns an error. A matching cached rate is then not proof
> > >>> that resource reconciliation finished. Retaining a temporary enable
> > >>> reference without a corresponding prepare reference also breaks a
> > >>> consumer's normal disable/unprepare sequence after a failed reparent.
> > >>>
> > >>> Make CCF acquire the affected tree's and parent paths' resources before
> > >>> notifiers or programming, and reconcile them only when the walk stops.
> > >>> Keep fault recovery independent of rate shortcuts and subsequent
> > >>> consumer reference-count changes. Require explicit recovery of an
> > >>> ancestor's uncertain parent selection rather than reporting success
> > >>> from a descendant request.
> > >>
> > >> I don't think all this is necessary to address the problem described
> > >> here and in the cover letter.
> > >>
> > >> IMO a new provider API is the wrong layer. The framework already has
> > >> the hook a provider needs: the rate change notifiers. What the core
> > >> should do instead is fix those notifiers, which do have a few issues.
> > >> You are fixing one in patch 1. Another fix, about setting the parent,
> > >> was sent recently:
> > >>
> > >> https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/
> > >>
> > >> You want to act on some changes before anything is programmed. PRE
> > >> notifiers are the right tool for this. The user of this change in
> > >> patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
> > >> it, ABORT drops it.
> > >>
> > >> Also, what is acquired here follows the requested clock. When an
> > >> ancestor switches parent, the chain of its new parent is not acquired,
> > >> although it feeds the whole subtree after the switch.
> > >>
> > >> With notifiers, the parent fault state is not needed either. As it is,
> > >> it blocks every request on or below the clock until the same switch is
> > >> retried.
> > >>
> > >> Could you tell me what you need from this approach that cannot be done
> > >> with (fixed) notifiers?
> > > 
> > > I'm a little worried about the ordering there, since some device
> > > drivers may also be registering listeners in parallel, so we don't
> > > get a clean split of what PRE means ("has power for sure " or "may
> > > not have power")
> > 
> > Do you have any thoughts on this? I'd like to proceed with this
> > series in one way or another.
> 
> As I have replied before, if there are things to fix in notifiers, we surely
> can discuss it but, at the moment, I don't think the complexity of what you
> are proposing here is justified.
> 
> Please allow some time for Brian to have a look.

I'm hoping to be able to look at this, plus some other requested changes
to the clk core, next week.

Brian

