Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332732;
	b=GiRlbkGFWo1ZZz5EMAiHoJjtLWwa45stlc4FNHdPMr0bU4zNfalZ+GvGH237AiFBSwEu
	 y4MAWRXu7xLtGEUcxRwhcs1DHEchy9Fvwa0iOBDS1FyH9zIwa6JOSg+O6tV1BHCv728lP
	 iboTGvm9+5MD8R6HLVNuWtAJ+YCX7H29LNaHQkFzaRv7ruRfkHT67+U5+Zi3XYZ4Y3P1h
	 5vxITJDnQIpN6glrcVzbEdFCh3rTMB35oc7XPuvCXc2XeFa4uH92vcaQnTZ3GrQS+YjYB
	 94HtbVBknACnAY3qNvYNiq2eXq8Qdd7Iodx/8dN6O2bQUKNhdD+Hg/ooGODmykHwPDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332732;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=En7t33fLTjGABgQQR4GuQ0GL3mU8sgKSHGOPkV5r89s=;
	b=aCqwYiWq5sBpUkMAhY+xDLjaxZVTIgkEE7733Sw8kdlkCJOZYORSiq7jNqIBdgJOT+nn
	 HQS/Ior9RaLDxVKb5H1jw5StEbBn5CjoDBOm7IpfkkM93yOnmLaKuYP/Kome/VvmdmIaK
	 xWJsJgdtpIKG2CNbLwhtaWb30hVTHnxWUX8qXNA35leDN+fgXdbG0p6Yr1qvv892H2309
	 btqdUUrpwoxRZUIsej3etG6IgT4NQvh2Zc38Qm41eudWRXsFJhVkpOb4osLnAeg+typRg
	 +RDEhRMSt2ZzoUXr14U9f/yf0+zfKaFxaXD6jtmK3QQky87M3feY7anq7rgr2pxwEFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BhHz64Um;
	arc=none smtp.remote-ip=91.218.175.136
Received: from mta0.migadu.com (out-136.mta0.migadu.com [91.218.175.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA67A606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA67A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BhHz64Um
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=laPOQH0iBAcc1YzOxlUk4tNI0hbuGv9sJAg+fwRpVaI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794332729; v=1; x=1794937529;
 b=BhHz64UmpVsQknrvtWm/kxjDmXCAkUcM8bLET6tdiyM8e+RFy6iGKYP1Rgb6HzzUnGTVLyk7
 0Np159dEc5JEHTQnrctUkdJ0h4uZMY0BAUorXIJl2TNc2HEggJ7jG+ne+s9aLMhfOIW2smg9ibe
 sNO+PmkhwwwN+6NwQpZyShAk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 96d764042bdf787d;
	Tue, 10 Nov 2026 17:45:26 +0000
X-Mizu-Trace-ID: 96d764042bdf787d
X-Migadu-Flow: FLOW_OUT
Message-ID: <e3c7bf98-64f9-4c29-b300-f54b7a4813d0@linux.dev>
Date: Wed, 11 Nov 2026 01:45:15 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/39] sysctl: replace overloaded extra pointers with
 typed bounds and context
To: Joel Granados <joel.granados@kernel.org>,
 David Laight <david.laight.linux@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1793204511.git.wen.yang@linux.dev>
 <20261029105837.2f8bee67@pumpkin>
 <0316f664-d98c-43be-92af-13c30436727a@linux.dev> <au85ISJ2qUsB7y-6@hobbes>
 <20261107170507.0d66cc2e@pumpkin> <avGVyB9erjZl8zIO@hobbes>
Content-Language: en-US
From: Wen Yang <wen.yang@linux.dev>
In-Reply-To: <avGVyB9erjZl8zIO@hobbes>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/9/26 18:07, Joel Granados wrote:
> On Sat, Nov 07, 2026 at 05:05:07PM +0000, David Laight wrote:
>> On Sat, 7 Nov 2026 16:27:39 +0100
>> Joel Granados <joel.granados@kernel.org> wrote:
>>
>>> On Mon, Nov 02, 2026 at 11:40:40PM +0800, Wen Yang wrote:
>>>>
>>>>
>>>> On 10/29/26 18:58, David Laight wrote:
>>>>> On Thu, 29 Oct 2026 00:34:39 +0800
>>>>> wen.yang@linux.dev wrote:
>>>>>    
>>>>>> From: Wen Yang <wen.yang@linux.dev>
>>>>>>
>>>>>> struct ctl_table describes an entry with data, maxlen and, until this
>>>>>> series, two untyped misc pointers in extra1 and extra2. Those two pointers
>>>>>> have accumulated at least seven unrelated jobs: a fixed bound, a bound read
>>>>>> through a pointer on every call, an object or namespace pointer, a small
>>>>>> integer cookie encoded into the pointer, a lock signal, NULL standing for
>>>>>> "no bound", and a value the core itself casts to unsigned int while
>>>>>> validating a u8 range. Nothing in the entry says which job applies, so
>>>>>> readers infer it from the handler, and the core gets it wrong where it
>>>>>> treats extra1 as an unsigned int.
>>> <--- snip --->
>>>>>> (~574 new min/max initializers) instead of pointing at constants. The
>>>>>> sysctl ABI is unchanged; the parport spintime minimum is corrected as
>>>>>> described above.
>>>>>>
>>>>>> The cost is 8 bytes per ctl_table entry on 64-bit (56 -> 64) and 4 bytes on
>>>>>> 32-bit, because priv is appended; the range read path gains no indirection
>>>>>> and the migrated entries no longer dereference a bound pointer.
>>>>>
>>>>> Can you remove the little-used 'priv' parameter by making the extra
>>>>> information just follow the table entry (nested structure) and have
>>>>> the relevant functions use container_of() to get the outer structure
>>>>> and extra values?
>>>>>    
>>>>
>>>>
>>>> Hi David, Hi Joel,
>>>>
>>>> I reworked the context side of the series so that priv is gone entirely;
>>>> and the final tree has no per-entry context pointer.
>>>> A small helper recovers the enclosing object, but it needs the slot
>>>> index from the caller:
>>>>
>>>>    #define sysctl_table_container(entry, type, member, index) ({       \
>>>>            static_assert(__same_type(*(entry),                         \
>>>>                                      typeof_member(type, member[0])),  \
>>>>                          "pointer type mismatch");                     \
>>>>            (type *)((void *)(entry) - offsetof(type, member) -         \
>>>>                     (size_t)(index) * sizeof(*(entry)));               \
>>>>    })
>>>>
>>>> The reason plain container_of() is not enough is that the core keeps the
>>>> table as a contiguous array.  For
>>>>
>>>>    struct addrconf_sysctl_table {
>>>>            struct addrconf_sysctl_ctx context;
>>>>            struct ctl_table table[];
>>>>    };
>>>>
>>>> the handler receives an interior entry, and
>>>>
>>>>    container_of(ctl, struct addrconf_sysctl_table, table)
>>>>        == (char *)outer + index * sizeof(struct ctl_table)
>>>>
>>>> for ctl == &outer->table[index].  It only returns the outer object for
>>>> index 0.  Passing the index explicitly keeps the original registered
>>>> entry usable:
>>>>
>>>>    static int addrconf_sysctl_forward(const struct ctl_table *ctl, ...)
>>>>    {
>>>>            struct addrconf_sysctl_table *t =
>>>>                    sysctl_table_container(ctl, struct addrconf_sysctl_table,
>>>>                                           table, ADDRCONF_SYSCTL_FORWARDING);
>>>>            const struct addrconf_sysctl_ctx *ctx = &t->context;
>>>>            ...
>>>>    }
>>>>
>>>> Shared handlers get one wrapper per slot; the common body does not need
>>>> to know its position:
>>>>
>>>>    #define DEVINET_CONF_WRAPPER(attr)                                  \
>>>>    static int devinet_conf_##attr(const struct ctl_table *ctl, ...)    \
>>>>    {                                                                   \
>>>>            struct devinet_sysctl_table *t =                            \
>>>>                    sysctl_table_container(ctl,                         \
>>>>                            struct devinet_sysctl_table, devinet_vars,  \
>>>>                            IPV4_DEVCONF_##attr - 1);                   \
>>>>            return devinet_conf_proc_common(ctl, &t->context, ...);     \
>>>>    }
>>>
>>> Two questions before seeing the actual implementation of this.
>>>
>>> 1. This means that we will have to add more macros to the sysctl
>>>     callers? There is a clear signal in [1] against overuse of macros.
>>> 2. I understand that you are doing this to avoid having priv. Is it to
>>>     save memory?  Yes. priv is a void* and we are also trying to get rid
>>>     of these. But this changes removes the use of two void pointers and
>>>     replaces it with just one.
>>
>> The idea behind removing the 'void *priv' is mostly to save memory.
>> There are a lot of systctl and hardly any need it.
>>
>> This solution does look nasty.
>> I suggested another where the size of the array entries was passed in
>> by the caller.

Hi Joel, David,

> That would mean changing all the proc handler signature. Right?
> 

Thanks. With David's stride approach, the signature could stay unchanged:

struct  nf_log_sysctl_entry {
	struct ctl_table ct;
	struct net *net;
	int family;
};

static int nf_log_handler(const struct ctl_table *table, int write,
			  void *buffer, size_t *lenp, loff_t *ppos)
{
	const struct nf_log_sysctl_entry *entry =
		container_of(table, struct nf_log_sysctl_entry, ctl);

	return nf_log_common(table, entry->net, entry->family,
			     write, buffer, lenp, ppos);
}

Proposed regisger API, not implemented yet:
	regisge_net_sysctl_stride(net, "net/netfilter/nf_log",
				  entries, ARRAY_SIZE(entries),
				  sizeof(entries[0]));


>> If that works it would allow the per-value function use container_of()
>> to get extra fields.
> Would this mean that the callers would have to have to keep track of the
> ctl_table offsets? in other words the sysctl indices and the caller's
> indices would have to be synced. right? 


   static const struct ctl_table *
   sysctl_entry_at(const struct ctl_table_header *head, size_t i)
   {
           return (const struct ctl_table *)
                   ((const char *)head->ctl_table +
                    i * head->ctl_table_stride);
   }

Table walks would retain the index:

   for (i = 0; i < head->ctl_table_size; i++) {
           entry = sysctl_entry_at(head, i);
           node = &head->node[i];
           ...
   }

Insertion/deletion would take the node directly. Readdir would retain
its RB-tree node cursor, recovering each entry through that node's header:

     entry = sysctl_entry_at(node->header, node - node->header->node);

No entry - head->ctl_table, caller slot constants or per-slot wrappers.
RB-tree order remains unchanged. Old APIs and generated directory/link
tables use sizeof(struct ctl_table).

The two mechanisms have existing precedents:

   /* include/linux/bsearch.h: explicit element size */
   pivot = base + (num >> 1) * size;
   result = cmp(key, pivot);

   /* include/linux/hwmon-sysfs.h: extended descriptor */
   struct sensor_device_attribute {
           struct device_attribute dev_attr;
           int index;
   };

   /* drivers/hwmon/adcxx.c: ordinary device_attribute callback */
   const struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);

hwmon registers &ad_input[i].dev_attr via device_create_file(); the core
passes that same base descriptor to the callback. These are precedents
for explicit-size traversal and embedded callback context separately,
not an existing strided sysctl registration API.

I agree that my fixed-slot solution adds maintenance overhead. Would
it make sense to explore this in three small steps?

   1. Entry-access helpers, unchanged packed layout.
   2. Header stride and compatible registration wrappers.
   3. nf_log conversion and code/memory comparison.

I would appreciate your thoughts on whether this is worth pursuing.


Thanks,
Wen


>>
>> David
>>
> 
> 
> 
>>>
>>> Best
>>>
>>> [1] https://lore.kernel.org/CAHk-=wjUmLrJd4KM4xvJHUN4P0r8oSu5LyvG4JipnhxizBrE9Q@mail.gmail.com
>>>>
>>>> Single-entry tables simply use slot 0:
>>>>
>>>>    struct devinet_forward_table *t =
>>>>            sysctl_table_container(ctl, struct devinet_forward_table, table,
>>>> 0);
>>>>
>>>>
>>>> The series is 20 commits over 134 files, with no priv at any point.  If
>>>> you would prefer a different shape for the helper or the wrappers, I am
>>>> happy to adjust it.
>>>>
>>>>
>>>> Thanks,
>>>> Wen
>>>>    
>>>>> David
>>>>>    
>>
