Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E30D4F391B;
	Tue, 22 Sep 2026 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073642; cv=none; b=ExP2sEHdXTs5Vm4zLj9ZFaOjlDgJvihpcnuynvaPacPUrMbOmlUUPKIYMKI8BAuUtKi+Yd7KjdFpU1b/mqs/Ca0E2CIRa3FI94q6auqZ/5XwEmB2YQy3D1DodabZ1XWeorYPt6jVaODS2HKyCLvHTeVR8CtVeAgqm7ydGm0aV10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073642; c=relaxed/simple;
	bh=6SHOXZRwGSLZUhiOFQuc5mbQU1ywz+XYMnYI1L3G3jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DqKLYoh6ruKqSB3wqoXi2mTpPDwyVAR8O9zNv8LfZ3SsMq4jguGnlpag4vAp7qHzHMtb/JepF9kT7CmyrdF+8qMaYoBKwXa5lubA/Az4/SUfjdhWeYQwu4NplGBNDbND6uIOhBgnzaL3NeNobsQoMbGeJm/7dRdSjINJ3xIcKp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Gq6DozBf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Gq6DozBf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 081181476;
	Tue, 22 Sep 2026 03:40:33 -0700 (PDT)
Received: from [10.0.152.207] (e121487-lin.cambridge.arm.com [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9F083F632;
	Tue, 22 Sep 2026 03:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790073636; bh=6SHOXZRwGSLZUhiOFQuc5mbQU1ywz+XYMnYI1L3G3jg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gq6DozBfbVooCvSLzrCn05HPEV9yYD5seyMJI6wgjyrWj+9DV1MaiHQt7kvPhWL4Z
	 DF4RfOOj2MaZoW9zqpStsUdXgD8DoSBMHYjrIQaiu39hBciSiW8RNvJ0yDjxmvrF53
	 N6wni7Sz1iYBcVCFCgbmy6Syk007BX7q62oyBGJk=
Message-ID: <8ca7bd18-ad17-4aa2-b184-9fd13921828f@arm.com>
Date: Tue, 22 Sep 2026 11:40:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG/PATCH] drivers/usb/mtu3: Work around mtu3_log_ep
 double-indirection issue
To: paulmck@kernel.org, Mark Rutland <mark.rutland@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
 <d7bb2cf4-11c3-468c-8749-99cc408299c7@arm.com>
 <b6c621eb-6d20-4e00-ac05-af122b630ca5@paulmck-laptop>
 <aae79c1c-8738-4b97-b1b9-d82d19d82d49@arm.com>
 <20260909093524.249c2a1a@gandalf.local.home>
 <arE4jcn4dCD9gos_@J2N7QTR9R3.cambridge.arm.com>
 <297673dd-6bcc-471a-9db0-980da3242339@paulmck-laptop>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <297673dd-6bcc-471a-9db0-980da3242339@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/21/26 17:14, Paul E. McKenney wrote:
> On Mon, Sep 21, 2026 at 03:00:45PM +0100, Mark Rutland wrote:
>> On Wed, Sep 09, 2026 at 09:35:24AM -0400, Steven Rostedt wrote:
>>> On Wed, 9 Sep 2026 11:31:28 +0100
>>> Vladimir Murzin <vladimir.murzin@arm.com> wrote:
>>>
>>>> I've done a little bit massaging and here is what worked for me
>>>>
>>>>
>>>> diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
>>>> index 89870175d635..4d4bae25fa1f 100644
>>>> --- a/drivers/usb/mtu3/mtu3_trace.h
>>>> +++ b/drivers/usb/mtu3/mtu3_trace.h
>>>> @@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>>>>                 __field(unsigned int, flags)
>>>>                 __field(unsigned int, direction)
>>>>                 __field(struct mtu3_gpd_ring *, gpd_ring)
>>>> +               __field(dma_addr_t, gpd_ring_dma)
>>>>         ),
>>>>         TP_fast_assign(
>>>>                 __assign_str(name);
>>>> @@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>>>>                 __entry->flags = mep->flags;
>>>>                 __entry->direction = mep->is_in;
>>>>                 __entry->gpd_ring = &mep->gpd_ring;
>>>> +               __entry->gpd_ring_dma = mep->gpd_ring.dma;
>>>>         ),
>>>>         TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
>>>>                 __get_str(name), usb_ep_type_string(__entry->type),
>>>>                 __entry->maxp, __entry->slot,
>>>>                 __entry->mult, __entry->maxburst,
>>>> -               __entry->gpd_ring, &__entry->gpd_ring->dma,
>>>> +               __entry->gpd_ring, &__entry->gpd_ring_dma,
>>>>                 __entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
>>>>                 __entry->flags & MTU3_EP_STALL ? 'S' : 's',
>>>>                 __entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
>>> LGTM,
>>>
>>> Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
>> On v7.3-rc4 I still see the splat Paul reported initially, and the above
>> fixes that, so FWIW:
>>
>> Tested-by: Mark Rutland <mark.rutland@arm.com>
>>
>> Steve, I assume you were expecting someone to send the above as a full
>> patch.
>>
>> Paul, do you intend to send a v2, or should Vladimir send out his
>> version as its own patch? I assume you're happy with a Reported-by, if
>> he does that?
> I figure that Vladimir's patch supersedes my hack, and so I would be
> quite happy with Vladimir sending a formal patch with my Reported-by.
> 
> 							Thanx, Paul
> 

Thanks everyone, formal patch is out

https://lore.kernel.org/linux-arm-kernel/20260922103756.104846-1-vladimir.murzin@arm.com/T/#u

Cheers
Vladimir
