Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B683FC5C9
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791020223; cv=none; b=RCeh7cxBFeeem+JTzh4E5wrmsBjk1lExOASM1Bf1la8lz6A/2uAGh58Vi476TYN++b6eQjJGdeacHo0TfKGlBywKrbZm7F0W+SVXLdwqsQ3owk73+PhXAJywBJcysnY8eimHGoQ/gavrmte/BHLdrViL1DK3CcJ7ellhgjI4EiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791020223; c=relaxed/simple;
	bh=SD9GPzeMs/yBH/s9I6BNIQ6ANVabzVI71BgxmVx9QDA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=bAE2g9IG5xhLjYVzUG8TRWjKtul/OohqkA+0+VP0O08YhNWsKCj9PDl4ofSHEYG98ZZYm/Ns7zIU9aeX6d2SRzSM60VZyVRj+jiDy3HbaVgS/RKEElyPSOKWF8C+6aSRnI7/Kzv6mJAHcs4F0WXZ0OHCIRKg9X5/xF+vi84faqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFJ5siwu; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFJ5siwu"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e4ad94ccf0so2065685ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791020221; x=1791625021; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SD9GPzeMs/yBH/s9I6BNIQ6ANVabzVI71BgxmVx9QDA=;
        b=FFJ5siwuWbfofCGWsHCd22/7efBp+HJRFXYonS+Bt7K57U9xWYJIXj7AcQ0sekt97J
         fVbPDJWDFkeUmXLp0rNomFCO1+XkDiEkfRUtRlWaskLp1IUePy2guGWakqKnyGBhKy1K
         Ww+EgshbOz7v/SLlpoY0UCcmMUoiLnGpaLS/nAC0zUHxY33ZSJOVWxEBAzFVk8xwDW1Z
         kmHEuuIy1D3f20F/ARhTq8FjYTcxSIeam2Se2uXRZQgb3ZXC/zkZKybE5jmyNrK72hWD
         Y7SfRbBo0DN4SFxt+nOQRJ9hmgXb2EWlLKf0gqUccgfy/SAw3eBgjr9aWadRAw229/zk
         YmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791020221; x=1791625021;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SD9GPzeMs/yBH/s9I6BNIQ6ANVabzVI71BgxmVx9QDA=;
        b=d2XM4cdUw+UXAFKb1mshaJgw6TWeNS+FE73S9czqn6LQSaOt8v2/B9UV8G9ZxhaYtc
         vqrO1fV4Ty4blZSoxiRPsXP2LEXsOMAhbrloagraXbtUwd6OJCGIUoU+8dFi0DnJaJk7
         Qn2lYXsJBz8davTcUgTzENO0Kt4+JFQ6CwSlU6Aqmsq+vSkYeSt7Dk4JQCawbosSMA20
         hPAXW8mbo1oFS2yWfbxwv5KJz5vTnh/lFA/Ge7acTBQ3RKxESaSofUmE43MJ8oB6z1kn
         dk8/ZFj9Bdvv68UZwUlyVFjmohB0HJrRC5i3zilRo/wzypC5kpv3SPwIQFfEF1Hqt4ap
         UFRw==
X-Forwarded-Encrypted: i=1; AKwUvBwNpPNCm3xNPrBdKsYy40ArxO3v70XLf1dmDMlLBwtnTphGoluiAJCFdhMJMRq3rLiILweuZANlRxbZmEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKm3hHY23lUyolOpD+EXiHwgx+MxPQ0X37DTHdVfRq7+Cpqt+xj
	5W57Mn7SxwO775NOR3C3zkR9ZPt4Q7euEF80r69Fmeu8DTBbR54AFw5o
X-Gm-Gg: AYBFou3hC8BYzrzgFMPV8D41KM+YYgxB5ElI2Yw6DAexD34sWumOmJfki6JGwiXgkLt
	60Twd/g3WLZ4iOHisYAHP0ZpLNOsB2HhYhl1BdA+BUEUHoC/Floz02GU30ti8cJ+5c9hC27oB1m
	N7E/I+XUrrB/DX+5ygDGvElEvxAeetqJnA9VdGp44x0JhYNWo38PXOqQsYp9WeytazpqhNiX0wN
	9ZbNDEneQl/gC4zdvgobUzXJ+y+UwdpFlTSn/VJidDuq8myRHGgdVLhee0j4GFu9KQrmsZ4g6V6
	XcFwWOP4EhIx0TsPnMlBSGYhE2Do/xQRWdBJxWnhqucxNqwM1EwKEX93DNowr2p9VIL8ePrsYGJ
	RDY7wPNNo1tcOXOduqoTEpJIQ1J1T+Kxk0tn+CfT94OHsO+5271eRNAaM7Su+QflTd+0v6gL92L
	junQBlcBxSfE5f2i2FNRtHlb01GuTJqxO7XBWOQTsJ50jfy8HvlTIR9mTpu835zPQaIUtEio6rN
	xzPfVDc8ZkYZEBaYk07fXH6koq3T54DHY9puAnKLXhPHFPiX23UstfeVZEBrK6V6Q9zMwSB3X4N
	gMQ=
X-Received: by 2002:a17:903:a86:b0:2dd:c168:c4e0 with SMTP id d9443c01a7336-2e4e99fcc78mr17367095ad.0.1791020220648;
        Sat, 03 Oct 2026 02:37:00 -0700 (PDT)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67df76sm16307115ad.15.2026.10.03.02.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 02:37:00 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 09:36:59 +0000
Message-Id: <DLV3OID9H5E8.2W0GIOP8FHJRN@gmail.com>
Cc: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, "Kaitao Cheng" <chengkaitao@kylinos.cn>
Subject: Re: [RFC v3 0/3] block: Introduce a BPF-based I/O scheduler
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Kaitao Cheng" <kaitao.cheng@linux.dev>, "Jens Axboe" <axboe@kernel.dk>
In-Reply-To: <20261003042748.33795-1-kaitao.cheng@linux.dev>
References: <20261003042748.33795-1-kaitao.cheng@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, Oct 03, 2026 at 12:27 PM Kaitao Cheng <kaitao.cheng@linux.dev> wrote:
> PFQ gives us a concrete policy to explore how well the UFQ interface
> supports more involved scheduling decisions and to guide further work on
> the framework. It has not yet been used in production, and further testing
> and workload evaluation are needed.

Third version in six months and still not a single number.
v2 got replies from the bots only.
Without a solid use case there is no point in polishing this.

> In particular, I would appreciate suggestions on the boundary between the
> UFQ framework and BPF policies, the struct_ops interface, and request
> ownership and fallback handling.

One global ufq_ops for all disks is not the best shape.
I'd do it like bpf_qdisc.

The ownership is the bigger problem.
The request sits in ctx->rq_lists and in a bpf map at the same time
and the kernel relies on the prog to keep the two in sync.
The prog holds rq->ref. rq holds q_usage_counter until
__blk_mq_free_request(). One request that the prog didn't return
from dispatch_req or left in a map and blk_mq_freeze_queue() waits
forever.
sched_ext has a watchdog that kicks the bpf scheduler out.
Something like that is necessary here too.

pw-bot: cr
